package Cfn::YAML::Schema;
  use base 'YAML::PP::Schema';
  use strict;
  use warnings;

  sub new {
    my ($class, %args) = @_;
    my $self = bless {}, $class;
    return $self;
  }

  sub shortcut_sequence_resolver {
    my $tag = shift;
    return (
      tag => "!$tag",
      on_create => sub {
        my ($constructor, $event) = @_;
        return { "Fn::$tag" => [] };
      },
      on_data => sub {
        my ($constructor, $ref, $items) = @_;
        push @{ $$ref->{"Fn::$tag"} }, @$items;
      }
    );
  }

  sub register {
    my ($self, %args) = @_;
    my $schema = $args{schema};

    my $tag_subs = {
      '!Ref'         => sub { { Ref => $_[0] } },
      '!Condition'   => sub { { Condition => $_[0] } },
      '!Base64'      => sub { { 'Fn::Base64'      => $_[0] } },
      '!Sub'         => sub { { 'Fn::Sub'         => $_[0] } },
      '!GetAZs'      => sub { { 'Fn::GetAZs'      => $_[0] } },
      '!ImportValue' => sub { { 'Fn::ImportValue' => $_[0] } },
      '!GetAtt' => sub {
        my $value = shift;
        my @parts = split /\./, $value, 2;
        { 'Fn::GetAtt' => [ $parts[0], $parts[1] ] }
      },
    };

    $schema->add_resolver(
      tag => qr/^!.*/,
      implicit => 0,
      match => [ regex => qr{^(.*)$} => sub {
        my ($self, $event) = @_;
	my $tag = $event->{ tag };
	return $tag_subs->{ $tag }->($event->{ value });
      } ]
    );

    $schema->add_resolver(
      tag => '!GetAtt',
      implicit => 0,
      match => [ regex => qr{^(.*)$} => sub {
        my ($self, $event) = @_;
        my $value = $event->{ value };
        my @parts = split /\./, $value, 2;
        { 'Fn::GetAtt' => [ $parts[0], $parts[1] ] }
      }]
    );

    $schema->add_resolver(shortcut_scalar_resolver('Base64'));
    $schema->add_resolver(shortcut_scalar_resolver('Sub'));
    $schema->add_resolver(shortcut_scalar_resolver('GetAZs'));
    $schema->add_resolver(shortcut_scalar_resolver('ImportValue'));
    
    $schema->add_sequence_resolver(shortcut_sequence_resolver('GetAtt'));
    $schema->add_sequence_resolver(shortcut_sequence_resolver('Cidr'));
    $schema->add_sequence_resolver(shortcut_sequence_resolver('Join'));
    $schema->add_sequence_resolver(shortcut_sequence_resolver('Select'));
    $schema->add_sequence_resolver(shortcut_sequence_resolver('FindInMap'));
    $schema->add_sequence_resolver(shortcut_sequence_resolver('Split'));
    $schema->add_sequence_resolver(shortcut_sequence_resolver('Sub'));
    $schema->add_sequence_resolver(shortcut_sequence_resolver('Equals'));
    $schema->add_sequence_resolver(shortcut_sequence_resolver('Or'));
    $schema->add_sequence_resolver(shortcut_sequence_resolver('And'));
    $schema->add_sequence_resolver(shortcut_sequence_resolver('If'));
    $schema->add_sequence_resolver(shortcut_sequence_resolver('Not'));

    $schema->add_mapping_resolver(
      tag => "!Transform",
      on_create => sub {
        my ($constructor, $event) = @_;
        return { "Fn::Transform" => {} };
      },
      on_data => sub {
        my ($constructor, $ref, $items) = @_;
        $$ref->{"Fn::Transform"} = { @$items };
      }
    );
    
    $schema->add_representer(
      class_equals => 'Cfn',
      code => sub {
        my ($representer, $node) = @_;
        my $self = $node->{ value };
        $node->{ data } = {
              (defined $self->AWSTemplateFormatVersion)?(AWSTemplateFormatVersion => $self->AWSTemplateFormatVersion):(),
              (defined $self->Description)?(Description => $self->Description):(),
              (defined $self->Transform) ? (Transform => $self->Transform) : (),
              (defined $self->Mappings)?(Mappings => { map { ($_ => $self->Mappings->{ $_ }->Value) } keys %{ $self->Mappings } }):(),
              (defined $self->Parameters)?(Parameters => { map { ($_ => $self->Parameters->{ $_ }->Value) } keys %{ $self->Parameters } }):(),
              (defined $self->Outputs)?(Outputs => { map { ($_ => $self->Outputs->{ $_ }->Value) } keys %{ $self->Outputs } }):(),
              (defined $self->Conditions)?(Conditions => { map { ($_ => $self->Condition($_)->Value) } $self->ConditionList }):(),
              (defined $self->Metadata)?(Metadata => { map { ($_ => $self->Metadata->{ $_ }->Value) } $self->MetadataList }):(),
              Resources => { map { ($_ => $self->Resource($_)) } $self->ResourceList },
         };
        return 1;
      },
    );
    
    $schema->add_representer(
      class_equals => 'Cfn::DynamicValue',
      code => sub { die "Implement me" },
    );
    
    $schema->add_representer(
      class_equals => 'Cfn::Value::TypedValue',
      code => sub { die "Implement me" },
    );
    
    $schema->add_representer(
      class_matches => 1,
      code => sub {
        my ($representer, $node) = @_;
        my $value = $node->{ value };
        if ($value->isa('Cfn::Resource')) {
          my $self = $value;
          $node->{ data } = {
            (defined $self->Properties) ? (Properties => $self->Properties) : (),
            (map { $_ => $self->$_->Value }
              grep { defined $self->$_ } qw/Metadata UpdatePolicy/),
            (map { $_ => $self->$_ }
              grep { defined $self->$_ } qw/Type DeletionPolicy DependsOn CreationPolicy Condition/),
          };
          return 1;
        } elsif ($value->isa('Cfn::Resource::Properties')) {
          my $self = $value;
          $node->{ data } = { map { my $name = $_->name; (defined $self->$name)?($name => $self->$name):() } $self->meta->get_all_attributes };
          return 1;
        } elsif ($value->isa('Cfn::Value::Function::Ref')) {
	  #$node->{ tag } = '!Ref';
          $node->{ data } = { 'Ref' => $value->LogicalId };
        } elsif ($value->isa('Cfn::Value::Function')) {
          my $value = $node->{ value };
	  #$node->{ tag } = sprintf '!%s', $value->Function;
          $node->{ data } = { $value->Function => $value->Value->Value };
          return 1;
        } elsif ($value->isa('Cfn::Value')) {
          $node->{ data } = $value->Value;
	  return 1;
        } else {
          die "Don't know how to serialize a $value";
        }
      }
    );
  }
1;
