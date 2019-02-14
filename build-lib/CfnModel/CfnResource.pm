package CfnModel::CfnResource;
  use Moose;
  use feature 'postderef';
  no warnings 'experimental::postderef';

  use CfnModel::CfnProperty;
  use Data::Graph::Util qw//;
  use CfnModel::CfnAttribute;

  has name => (is => 'ro', required => 1);
  has root => (is => 'ro', isa => 'CfnModel', required => 1);
  has spec => (is => 'ro', isa => 'AWSJsonSpec::ResourceType', required => 1);

  has spec_version => (is => 'ro', isa => 'Str', lazy => 1, default => sub {
    my $self = shift;
    $self->root->spec->ResourceSpecificationVersion;
  });

  sub build_property {
    my ($self, $name) = @_;
    return CfnModel::CfnProperty->new(
      name => $name,
      parent => $self,
      root => $self->root,
      spec => $self->spec->Properties->{ $name },
    );
  }

  sub build_attribute {
    my ($self, $name) = @_;
    return CfnModel::CfnAttribute->new(
      name => $name,
      spec => $self->spec->Attributes->{ $name },
    );
  }

  has attributes => (is => 'ro', isa => 'HashRef[CfnModel::CfnAttribute]', lazy => 1, default => sub {
    my $self = shift;
    my $atts = {};

    return $atts if (not defined $self->spec->Attributes);

    foreach my $attribute_name (keys $self->spec->Attributes->%*) {
      $atts->{ $attribute_name } = $self->build_attribute($attribute_name);
    }
    return $atts;
  });

  has properties => (is => 'ro', isa => 'HashRef[CfnModel::CfnProperty]', lazy => 1, default => sub {
    my $self = shift;
    my $props = {};
    foreach my $property_name (keys $self->spec->Properties->%*) {
      $props->{ $property_name } = $self->build_property($property_name);
    }
    return $props;
  });

  has subtypes => (is => 'ro', isa => 'HashRef[CfnModel::CfnSubtype]', lazy => 1, default => sub {
    my $self = shift;
    my $namespace = $self->name;
    my $types = {};
    foreach my $type_name (keys $self->root->subtypes->%*) {
      if (my ($baretype_name) = $type_name =~ m/^$namespace\.(.*)$/) {
        $types->{ $baretype_name } = $self->root->subtypes->{ $type_name };
      }
    }
    return $types;
  }); 

  has subtypes_by_cfn_type => (is => 'ro', isa => 'HashRef[CfnModel::CfnSubtype]', lazy => 1, default => sub {
    my $self = shift;
    return { map { $_->cfn_type => $_ } values $self->subtypes->%* };
  });

  has ordered_subtypes => (is => 'ro', isa => 'ArrayRef[Str]', lazy => 1, default => sub {
    my $self = shift;

    my $deps = { };
 
    foreach my $subtype (values $self->subtypes->%*){
      my $st_name = $subtype->cfn_type;
      $deps->{ $st_name } = [] if (not defined $deps->{ $st_name });

      foreach my $prop (values $subtype->properties->%*) {
        if ($prop->cfn_type =~ m/Resource::Properties/ and $prop->of_type ne $st_name) {
          push $deps->{ $st_name }->@*, $prop->of_type;
        }
      }
    }

    # sort keys is important to maintain the output of ordered_subtypes stable
    # reverse is because toposort returns the dependants first
    my $order = [ sort keys %$deps ];
    my @sorted = reverse Data::Graph::Util::toposort($deps, $order);

use Data::Dumper;
print Dumper($self->name, $order, \@sorted) if ($self->name eq 'AWS::SES::ReceiptRule' or $self->name eq 'AWS::KinesisFirehose::DeliveryStream');

    return \@sorted;
  });

  has property_list => (is => 'ro', isa => 'ArrayRef[CfnModel::CfnProperty]', lazy => 1, builder => '_proplist_builder');
  has attribute_list => (is => 'ro', isa => 'ArrayRef[CfnModel::CfnAttribute]', lazy => 1, builder => '_attlist_builder');

  sub _proplist_builder {
    my $self = shift;
    return [ map { $self->properties->{ $_ } } sort keys $self->properties->%* ];
  }

  sub _attlist_builder {
    my $self = shift;
    return [ map { $self->attributes->{ $_ } } sort keys $self->attributes->%* ];
  }

  has template_file => (is => 'ro', default => 'cfn_resource'); 

  sub write_class {
    my $self = shift;
    $self->process_template;
  }

  with 'CfnModel::ClassWriter';
1;
