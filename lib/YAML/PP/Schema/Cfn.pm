package YAML::PP::Schema::Cfn;
  use base 'YAML::PP::Schema';
  use strict;
  use warnings;

  sub resolver_fn_for {
    my $fn = shift;
    return sub {
      my $value = shift;
      return { $fn => $value }
    }
  }

  sub new {
    my ($class, %args) = @_;
    my $self = bless {}, $class;
    return $self;
  }

  sub register {
    my ($self, %args) = @_;
    my $schema = $args{schema};

    $schema->add_resolver(
      tag => '!Ref',
      implicit => 0,
      match => [ regex => qr{^(.*)$} => resolver_fn_for('Ref')]
    );
    
    $schema->add_resolver(
      tag => '!Base64',
      implicit => 0,
      match => [ regex => qr{^(.*)$} => resolver_fn_for('Fn::Base64') ]
    );
    
    $schema->add_resolver(
      tag => '!Sub',
      implicit => 0,
      match => [ regex => qr{^(.*)$} => resolver_fn_for('Fn::Sub') ]
    );
    
    $schema->add_resolver(
      tag => '!GetAZs',
      implicit => 0,
      match => [ regex => qr{^(.*)$} => resolver_fn_for('Fn::GetAZs') ]
    );
    
    $schema->add_resolver(
      tag => '!ImportValue',
      implicit => 0,
      match => [ regex => qr{^(.*)$} => resolver_fn_for('Fn::ImportValue') ]
    );
    
    $schema->add_resolver(
      tag => '!GetAtt',
      implicit => 0,
      match => [ regex => qr{^(.*)$} => sub {
        my $value = shift;
        my @parts = split /\./, $value, 2;
        { 'Fn::GetAtt' => [ $parts[0], $parts[1] ] }
      }]
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
