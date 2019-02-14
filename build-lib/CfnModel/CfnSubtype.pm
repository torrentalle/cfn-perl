package CfnModel::CfnSubtype;
  use Moose;
  use feature 'postderef';
  no warnings 'experimental::postderef';

  has name => (is => 'ro', required => 1);
  has parent => (is => 'ro', required => 1, isa => 'CfnModel');
  has root => (is => 'ro', isa => 'CfnModel', required => 1);
  has spec => (is => 'ro', required => 1, isa => 'AWSJsonSpec::PropertyType',
    handles => {
      documentation => 'Documentation',
    }
  );

  sub build_property {
    my ($self, $name) = @_;
    return CfnModel::CfnProperty->new(
      name => $name,
      parent => $self,
      root => $self->root,
      spec => $self->spec->Properties->{ $name },
    );
  }

  has properties => (is => 'ro', isa => 'HashRef[CfnModel::CfnProperty]', lazy => 1, default => sub {
    my $self = shift;
    if (not defined $self->spec->Properties){
      warn $self->name . " doesn't have properties in the spec";
      return {}
    }
    my $props = {};
    foreach my $property_name (keys $self->spec->Properties->%*) {
      $props->{ $property_name } = $self->build_property($property_name);
    }
    return $props;
  });

  # for whar resource is this subtype. It's name is AWS::XXX:YYY.Subtype
  has in_resource => (is => 'ro', isa => 'Str', lazy => 1, default => sub {
    my $self = shift;
    return [ split /\./, $self->name ]->[ 0 ];
  });

  has subtype_name => (is => 'ro', isa => 'Str', lazy => 1, default => sub {
    my $self = shift;
    return [ split /\./, $self->name ]->[ 1 ];
  });

  has class_name => (is => 'ro', isa => 'Str', lazy => 1, default => sub {
    my $self = shift;
    my $class_name = $self->name;
    $class_name =~ s/\./::/;
    return $class_name;
  });

  has property_in_resources => (is => 'ro', isa => 'ArrayRef', lazy => 1, default => sub {
    my $self = shift;

    my @related_props;

    # Look for this subtype in the resource it's connected to
    my @props = values $self->root->classes->{ $self->in_resource }->properties->%*;
    push @related_props,
      grep { $_->of_type eq $self->cfn_type }
      grep { not $_->is_primitive_type }
      @props;

    # Not all subtypes are declared in the resource. Some are properties of a subtype
    my @st_props = map { values $_->properties->%* } values $self->root->classes->{ $self->in_resource }->subtypes->%*;
    push @related_props,
      grep { $_->of_type eq $self->cfn_type }
      grep { not $_->is_primitive_type }
      @st_props;

    return \@related_props;
  });

  # The fact that this subtype lives in an array or not is not in it's own declaration:
  # it's in the properties of the resources that declare they use it as an array or not.
  # Any declaration of this subtype in a property that is an array will activate is_in_array
  has is_in_array => (is => 'ro', isa => 'Bool', lazy => 1, default => sub {
    my $self = shift;
    my @in_array = grep { $_->is_array } $self->property_in_resources->@*;
    return (@in_array >= 1);
  });

  # Same comment for is_in_map than for is_in_array
  has is_in_map => (is => 'ro', isa => 'Bool', lazy => 1, default => sub {
    my $self = shift;
    my @in_map = grep { $_->is_map } $self->property_in_resources->@*;
    return (@in_map >= 1);
  });

  has cfn_type => (is => 'ro', isa => 'Str', lazy => 1, default => sub {
    my $self = shift;

    return $self->class_name;
  });

1;
