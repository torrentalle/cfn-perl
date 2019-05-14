package CfnModel::CfnProperty;
  use Moose;
  use feature qw(postderef);

  has name => (is => 'ro', required => 1);
  has parent => (is => 'ro', required => 1); #, isa => 'CfnModel::CfnResource|CfnModel::CfnSubtype');
  has root => (is => 'ro', isa => 'CfnModel', required => 1);
  has spec => (is => 'ro', required => 1, isa => 'AWSJsonSpec::Property',
    handles => {
      required => 'Required',
      mutability_role => 'UpdateType',
      
    }
  );

  sub _crawl_to_root {
    my $thing = shift;
    if ($thing->isa('CfnModel::CfnResource') or $thing->isa('CfnModel::CfnSubtype')) {
      return $thing;
    } else {
      return _crawl_to_root($thing->parent);
    }
  }

  has belongs_to_resource => (
    is => 'ro',
    #isa => 'CfnModel::CfnResource',
    lazy => 1,
    default => sub {
      my $self = shift;
      my $thing =  _crawl_to_root($self);
      return undef if ($thing->isa('CfnModel::CfnSubtype'));
      return $thing->name;
    }
  );
  has belongs_to_subtype => (
    is => 'ro',
    #isa => 'CfnModel::CfnSubtype',
    lazy => 1,
    default => sub {
      my $self = shift;
      my $thing =  _crawl_to_root($self);
      return $thing->in_resource if ($thing->isa('CfnModel::CfnSubtype'));
      return undef;
    }
  );

  has is_json => (is => 'ro', isa => 'Str', lazy => 1, default => sub {
    my $self = shift;
    return (defined $self->spec->PrimitiveType and $self->spec->PrimitiveType eq 'Json');
  });

  has is_array => (is => 'ro', isa => 'Str', lazy => 1, default => sub {
    my $self = shift;
    return (defined $self->spec->Type and $self->spec->Type eq 'List');
  });

  has is_array_of_arrays => (is => 'ro', isa => 'Bool', lazy => 1, default => sub {
    my $self = shift;
    return 0 if (not $self->is_array);
    my $subtype = $self->belongs_to_subtype;
    return 0 if (not defined $subtype);
    my $type_in_array = $self->spec->ItemType;

    return (defined $self->root->classes->{ $subtype }->arrays_of_arrays->{ $type_in_array });
  });

  has is_map => (is => 'ro', isa => 'Str', lazy => 1, default => sub {
    my $self = shift;
    return (defined $self->spec->Type and $self->spec->Type eq 'Map');
  });

  has is_complex_type => (is => 'ro', isa => 'Str', lazy => 1, default => sub {
    my $self = shift;
    return (defined $self->spec->Type and not $self->is_map and not $self->is_array);
  });

  has is_primitive_type => (is => 'ro', isa => 'Bool', lazy => 1, default => sub {
    my $self = shift;
    return (defined $self->spec->PrimitiveType or defined $self->spec->PrimitiveItemType);
  });

  has of_type => (is => 'ro', isa => 'Str', lazy => 1, default => sub {
    my $self = shift;
    die "No of_type" if ($self->is_primitive_type);
    return 'TagType' if (defined $self->spec->ItemType and $self->spec->ItemType eq 'Tag');

    my $item_method = ($self->is_array or $self->is_map) ? 'ItemType' : 'Type';
    return $self->belongs_to_resource . '::' . $self->spec->$item_method if (defined $self->belongs_to_resource);
    return $self->belongs_to_subtype . '::' . $self->spec->$item_method if (defined $self->belongs_to_subtype);
    return "Don't know how to process this type";
  });

  has cfn_type => (is => 'ro', isa => 'Str', lazy => 1, default => sub {
    my $self = shift;

    if ($self->is_array) {
      if ($self->is_primitive_type) {
        return 'Cfn::Value::Array|Cfn::Value::Function|Cfn::DynamicValue';
      } elsif ($self->is_array_of_arrays) {
        return 'ArrayOfArrayOfCfn::Resource::Properties::' . $self->of_type;
      } else {
        return 'ArrayOfCfn::Resource::Properties::' . $self->of_type;
      }
    } elsif ($self->is_map) {
      return ($self->is_primitive_type) ?
               'Cfn::Value::Hash|Cfn::DynamicValue' : 
               'MapOfCfn::Resource::Properties::' . $self->of_type;
    } elsif ($self->is_json) {
      return 'Cfn::Value::Json|Cfn::DynamicValue';
    } else {
      if ($self->is_primitive_type) {
        return 'Cfn::Value::' . $self->spec->PrimitiveType;
      } elsif (defined $self->spec->Type) {
        my $prefix = 'Cfn::Resource::Properties::';
        return $prefix . $self->of_type
      } else {
        die "Don't know how to handle type for property " . $self->name . " on " . $self->parent->name;
      }
    }
  });

1;
