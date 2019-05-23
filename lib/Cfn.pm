package Cfn::TypeLibrary {

  use Moose::Util::TypeConstraints;

  coerce 'Cfn::Resource::UpdatePolicy',
    from 'HashRef',
    via { Cfn::Resource::UpdatePolicy->new( %$_ ) };

  coerce 'Cfn::Resource::UpdatePolicy::AutoScalingReplacingUpdate',
    from 'HashRef',
    via { Cfn::Resource::UpdatePolicy::AutoScalingReplacingUpdate->new( %$_ ) };

  coerce 'Cfn::Resource::UpdatePolicy::AutoScalingRollingUpdate',
    from 'HashRef',
    via { Cfn::Resource::UpdatePolicy::AutoScalingRollingUpdate->new( %$_ ) };

  coerce 'Cfn::Resource::UpdatePolicy::AutoScalingScheduledAction',
    from 'HashRef',
    via { Cfn::Resource::UpdatePolicy::AutoScalingScheduledAction->new( %$_ ) };

  subtype 'Cfn::Resource::UpdatePolicy::AutoScalingRollingUpdate::SuspendProcesses',
    as 'Cfn::Value::Array',
    where {
      my $array = $_->Value;

      my $valid = { Launch => 1, Terminate => 1, HealthCheck => 1, ReplaceUnhealthy => 1,
                    AZRebalance => 1, AlarmNotification =>1, ScheduledActions => 1,
                    AddToLoadBalancer => 1 };

      my @val = grep { $valid->{ $_->Value } } @$array;
      # The array is valid if all of it's values are found in $valid
      return @val == @$array;
    },
    message { 'This type only supports the following values in the array: "Launch, Terminate, HealthCheck, ReplaceUnhealthy, AZRebalance, AlarmNotification, ScheduledActions, AddToLoadBalancer"' };

  coerce 'Cfn::Resource::UpdatePolicy::AutoScalingRollingUpdate::SuspendProcesses',
    from 'HashRef',  via (\&coerce_hash),
    from 'ArrayRef', via (\&coerce_array);

  subtype 'Cfn::Resource::DeletionPolicy',
    as 'Str',
    where { $_ eq 'Delete' or $_ eq 'Retain' or $_ eq 'Snapshot' },
    message { "$_ is an invalid DeletionPolicy" };

  subtype 'Cfn::Value::ArrayOfPrimitives',
    as 'Cfn::Value::Array',
    where { @{ $_[0]->Value } == grep { $_->isa('Cfn::Value::Primitive') } @{ $_[0]->Value } },
    message { 'This type only supports Primitives' };

  sub coerce_array {
    Cfn::Value::Array->new(Value => [
      map { Moose::Util::TypeConstraints::find_type_constraint('Cfn::Value')->coerce($_) } @$_
    ])
  }

  sub try_function {
    my $arg = shift;
    my @keys = keys %$arg;
    my $first_key = $keys[0];
    if (@keys == 1 and (substr($first_key,0,4) eq 'Fn::' or $first_key eq 'Ref' or $first_key eq 'Condition')){
      if ($first_key eq 'Fn::GetAtt') {
        return Cfn::Value::Function::GetAtt->new(Function => $first_key, Value => $arg->{ $first_key });
      } elsif ($keys[0] eq 'Ref'){
        return Cfn::Value::Function::Ref->new( Function => $first_key, Value => $arg->{ $first_key });
      } elsif ($keys[0] eq 'Condition'){
        return Cfn::Value::Function::Condition->new( Function => $first_key, Value => $arg->{ $first_key });
      } else {
        return Cfn::Value::Function->new(Function => $first_key, Value => $arg->{ $first_key });
      }
    } else {
      return undef;
    }
  }

  sub coerce_hash  {
    my $arg = $_;
    my $function = try_function($arg);
    return $function if (defined $function);
    my @keys = keys %$arg;
    return Cfn::Value::Hash->new(Value => {
      map { $_ => Moose::Util::TypeConstraints::find_type_constraint('Cfn::Value')->coerce($arg->{$_}) } @keys
    });
  }

  sub coerce_hashref_to_function {
    my $val = $_;
    my $function = try_function($val);
    return $function if (defined $function);
    die "Is not a function";
  }

  coerce 'Cfn::Value',
    from 'Value',  via { Cfn::Value::Primitive->new( Value => $_ ) },
    from 'HashRef',  via (\&coerce_hash),
    from 'ArrayRef', via (\&coerce_array);

  subtype 'Cfn::Value::Boolean',   as 'Cfn::Value';
  subtype 'Cfn::Value::Integer',   as 'Cfn::Value';
  subtype 'Cfn::Value::Long',      as 'Cfn::Value';
  subtype 'Cfn::Value::String',    as 'Cfn::Value';
  subtype 'Cfn::Value::Double',    as 'Cfn::Value';
  subtype 'Cfn::Value::Timestamp', as 'Cfn::Value';
  subtype 'Cfn::Value::Json',      as 'Cfn::Value';

  coerce 'Cfn::Value::Boolean',
    from 'Int', via {
      my $val = $_;

      if ($val == 1) {
        Cfn::Boolean->new( Value => 1, stringy => 0 );
      } elsif($val == 0) {
        Cfn::Boolean->new( Value => 0, stringy => 0 );
      } else {
        die "Cannot convert $val to an boolean value";
      }
    },
    from 'Str', via {
      my $val = $_;
      if (lc($val) eq 'false') {
        Cfn::Boolean->new( Value => 0, stringy => 1 );
      } elsif (lc($val) eq 'true') {
        Cfn::Boolean->new( Value => 1, stringy => 1 );
      } else {
        die "Cannot convert string $val to a boolean value";
      }
    },
    from 'Object', via {
      my $val = $_;

      die "Cannot coerce a boolean from a non JSON::PP::Boolean or JSON::XS::Boolean" if (not $val->isa('JSON::PP::Boolean') and not $val->isa('JSON::XS::Boolean'));
      if ($val == 1) {
        Cfn::Boolean->new( Value => 1, stringy => 0 );
      } elsif($val == 0) {
        Cfn::Boolean->new( Value => 0, stringy => 0 );
      } else {
        die "Cannot convert $val to an boolean value";
      }
    },
    from 'HashRef', via \&coerce_hashref_to_function;

  coerce 'Cfn::Value::Integer',
    from 'Int',  via { Cfn::Integer->new( Value => $_ ) },
    from 'HashRef', via \&coerce_hashref_to_function;

  coerce 'Cfn::Value::Long',
    from 'Num',  via { Cfn::Long->new( Value => $_ ) },
    from 'HashRef', via \&coerce_hashref_to_function;

  coerce 'Cfn::Value::String',
    from 'Str',  via { Cfn::String->new( Value => $_ ) },
    from 'HashRef', via \&coerce_hashref_to_function;

  coerce 'Cfn::Value::Double',
    from 'Num',  via { Cfn::Double->new( Value => $_ ) },
    from 'HashRef', via \&coerce_hashref_to_function;

  coerce 'Cfn::Value::Timestamp',
    from 'Num',  via { Cfn::Timestamp->new( Value => $_ ) },
    from 'HashRef', via \&coerce_hashref_to_function;

  subtype 'Cfn::Value::Json',
    as 'Cfn::Value::Hash';

  coerce 'Cfn::Value::Array',
    from 'HashRef',  via (\&coerce_hash),
    from 'ArrayRef', via (\&coerce_array);

  coerce 'Cfn::Value::ArrayOfPrimitives',
    from 'HashRef',  via (\&coerce_hash),
    from 'ArrayRef', via (\&coerce_array);

  coerce 'Cfn::Value::Hash',
    from 'HashRef',  via (\&coerce_hash);

  subtype 'Cfn::Transform',
       as 'ArrayRef[Str]';

  coerce 'Cfn::Transform',
    from 'ArrayRef', via {
      return $_;
    };
  coerce 'Cfn::Transform',
    from 'Value', via {
      return [ $_ ];
    };

  subtype 'Cfn::MappingHash',
    as 'HashRef[Cfn::Mapping]';

  my $cfn_mapping_constraint = Moose::Util::TypeConstraints::find_type_constraint('Cfn::Mapping');

  coerce 'Cfn::MappingHash',
    from 'HashRef',  via {
      my $original = $_;
      return { map { ($_ =>  $cfn_mapping_constraint->coerce($original->{ $_ }) ) } keys %$original };
    };

  coerce 'Cfn::Mapping',
    from 'HashRef',  via {
      return Cfn::Mapping->new(Map => $_);
    };

  subtype 'Cfn::OutputHash',
    as 'HashRef[Cfn::Output]';

  my $cfn_output_constraint = Moose::Util::TypeConstraints::find_type_constraint('Cfn::Output');
  coerce 'Cfn::OutputHash',
    from 'HashRef',  via {
      my $original = $_;
      return { map { ($_ =>  $cfn_output_constraint->coerce($original->{ $_ }) ) } keys %$original };
    };

  coerce 'Cfn::Output',
    from 'HashRef',  via {
      return Cfn::Output->new(%$_);
    };

  subtype 'Cfn::ConditionHash',
    as 'HashRef[Cfn::Value]';

  my $cfn_value_constraint = Moose::Util::TypeConstraints::find_type_constraint('Cfn::Value');
  coerce 'Cfn::ConditionHash',
    from 'HashRef',  via {
      my $original = $_;
      return { map { ($_ =>  $cfn_value_constraint->coerce($original->{ $_ }) ) } keys %$original };
    };

  subtype 'Cfn::ParameterHash',
    as 'HashRef[Cfn::Parameter]';

  my $cfn_parameter_constraint = Moose::Util::TypeConstraints::find_type_constraint('Cfn::Parameter');
  coerce 'Cfn::ParameterHash',
    from 'HashRef',  via {
      my $original = $_;
      return { map { ($_ =>  $cfn_parameter_constraint->coerce($original->{ $_ }) ) } keys %$original };
    };

  coerce 'Cfn::Parameter',
    from 'HashRef',  via {
      return Cfn::Parameter->new(%$_);
    };

  subtype 'Cfn::ResourceHash',
    as 'HashRef[Cfn::Resource]';

  my $cfn_resource_constraint = Moose::Util::TypeConstraints::find_type_constraint('Cfn::Resource');
  coerce 'Cfn::ResourceHash',
    from 'HashRef',  via {
      my $original = $_;
      return { map { ($_ =>  $cfn_resource_constraint->coerce($original->{ $_ }) ) } keys %$original };
    };

  coerce 'Cfn::Resource',
    from 'HashRef',  via {
      my $type = $_->{Type};
      die "Can't coerce HashRef into a Cfn::Resource if it doesn't have a Type key" if (not defined $type);
      my $class_type = ($type =~ m/^Custom\:\:/) ? "AWS::CloudFormation::CustomResource" : $type;

      Cfn->load_resource_module($class_type);
      return "Cfn::Resource::$class_type"->new(
        %$_
      );
    };

  subtype 'Cfn::MetadataHash',
    as 'HashRef[Cfn::Value]';

  coerce 'Cfn::MetadataHash',
    from 'HashRef',  via {
      my $original = $_;
      return { map { ($_ =>  $cfn_value_constraint->coerce($original->{ $_ }) ) } keys %$original };
    };

  coerce 'Cfn::Value::Json',
    from 'HashRef',  via (\&coerce_hash);

  enum 'Cfn::Parameter::Type', [
    'String',
    'Number',
    'List<Number>',
    'CommaDelimitedList',
    'AWS::EC2::AvailabilityZone::Name',
    'List<AWS::EC2::AvailabilityZone::Name>',
    'AWS::EC2::Instance::Id',
    'List<AWS::EC2::Instance::Id>',
    'AWS::EC2::Image::Id',
    'List<AWS::EC2::Image::Id>',
    'AWS::EC2::KeyPair::KeyName',
    'AWS::EC2::SecurityGroup::GroupName',
    'List<AWS::EC2::SecurityGroup::GroupName>',
    'AWS::EC2::SecurityGroup::Id',
    'List<AWS::EC2::SecurityGroup::Id>',
    'AWS::EC2::Subnet::Id',
    'List<AWS::EC2::Subnet::Id>',
    'AWS::EC2::Volume::Id',
    'List<AWS::EC2::Volume::Id>',
    'AWS::EC2::VPC::Id',
    'List<AWS::EC2::VPC::Id>',
    'AWS::Route53::HostedZone::Id',
    'List<AWS::Route53::HostedZone::Id>',
  ];

  subtype 'ArrayOfCfn::Resource::Properties::TagType',
    as 'Cfn::Value',
    where { $_->isa('Cfn::Value::Array') or $_->isa('Cfn::Value::Function') },
    message { "$_ is not a Cfn::Value or a Cfn::Value::Function" };

  coerce 'ArrayOfCfn::Resource::Properties::TagType',
    from 'HashRef',
    via {
      if (my $f = Cfn::TypeLibrary::try_function($_)) {
        return $f
      } else {
        die 'Only accepts functions';
      }
    },
    from 'ArrayRef',
    via {
      Cfn::Value::Array->new(Value => [
        map {
          Moose::Util::TypeConstraints::find_type_constraint('Cfn::Resource::Properties::TagType')->coerce($_)
        } @$_
      ]);
    };

  subtype 'Cfn::Resource::Properties::TagType',
    as 'Cfn::Value';

  coerce 'Cfn::Resource::Properties::TagType',
    from 'HashRef',
    via {
      if (my $f = Cfn::TypeLibrary::try_function($_)) {
        return $f
      } else {
        return Cfn::Resource::Properties::Tag->new( %$_ );
      }
    };

  coerce 'Cfn::Internal::Options',
    from 'HashRef',
    via { Cfn::Internal::Options->new(%$_) };
};

package Cfn::Value {
  use Moose;
  # just a base class for everything that can go into a cloudformation
  # object
  sub as_hashref { shift->Value->as_hashref(@_) }
}

package Cfn::DynamicValue {
  use Moose;
  extends 'Cfn::Value';
  has Value => (isa => 'CodeRef', is => 'rw', required => 1);

  sub to_value {
    my $self = shift;
    return Moose::Util::TypeConstraints::find_type_constraint('Cfn::Value')->coerce($self->resolve_value(@_));
  }

  sub resolve_value {
    my $self = shift;
    my @args = reverse @_;
    my (@ret) = ($self->Value->(@args));
    @ret = map { (not ref($_) or ref($_) eq 'HASH')?$_:$_->as_hashref(@args) } @ret;
    return (@ret);
  }

  override as_hashref => sub {
    my $self = shift;
    return $self->resolve_value(@_);
  };
}

package Cfn::Value::Function {
  use Moose;
  extends 'Cfn::Value';
  has Function => (isa => 'Str', is => 'rw', required => 1);
  has Value => (isa => 'Cfn::Value', is => 'rw', required => 1, coerce => 1);

  sub as_hashref {
    my $self = shift;
    my $key = $self->Function;
    return { $key => $self->Value->as_hashref(@_) }
  }
}

package Cfn::Value::TypedValue {
  use Moose;
  extends 'Cfn::Value';

  sub as_hashref {
    my $self = shift;
    my $hr = { map  { ( $_->[0] => $_->[1]->as_hashref(@_) ) }
               grep { defined $_->[1]  }
               map { [ $_->name, $_->get_value($self) ] }
               $self->meta->get_all_attributes
             };
    return $hr;
  }
}

package Cfn::Value::Function::Condition {
  use Moose;
  extends 'Cfn::Value::Function';
  has Value => (isa => 'Cfn::Value', is => 'rw', required => 1, coerce => 1);

  sub Condition {
    shift->Value->Value;
  }
}

package Cfn::Value::Function::Ref {
  use Moose;
  extends 'Cfn::Value::Function';
  has Value => (isa => 'Cfn::Value', is => 'rw', required => 1, coerce => 1);

  sub LogicalId {
    shift->Value->Value;
  }
}

package Cfn::Value::Function::GetAtt {
  use Moose;
  extends 'Cfn::Value::Function';
  has Value => (isa => 'Cfn::Value::ArrayOfPrimitives', is => 'rw', required => 1, coerce => 1);

  sub LogicalId {
    my $self = shift;
    $self->Value->Value->[0]->Value;
  }

  sub Property {
    my $self = shift;
    $self->Value->Value->[1]->Value;
  }
}


package Cfn::Value::Array {
  use Moose;
  extends 'Cfn::Value';
  has Value => (
    is => 'rw',
    required => 1,
    isa => 'ArrayRef[Cfn::Value|Cfn::Resource::Properties]',
    traits => ['Array'],
    handles => {
      'Count' => 'count',
    }
  );

  sub as_hashref {
    my $self = shift;
    my @args = @_;
    return [ map { $_->as_hashref(@args)  } @{ $self->Value } ]
  };
}

package Cfn::Value::Hash {
  use Moose;
  extends 'Cfn::Value';
  has Value => (
    is => 'rw',
    required => 1,
    isa => 'HashRef[Cfn::Value]',
  );

  override as_hashref => sub {
    my $self = shift;
    my @args = @_;
    return { map { $_ => $self->Value->{$_}->as_hashref(@args) } keys %{ $self->Value } };
  };
}



package Cfn::Value::Primitive {
  use Moose;
  extends 'Cfn::Value';
  has Value => (isa => 'Value', is => 'rw', required => 1);
  override as_hashref => sub {
    my $self = shift;
    return $self->Value;
  }
}

package Cfn::Boolean {
  use Moose;
  use JSON::MaybeXS;
  extends 'Cfn::Value::Primitive';
  has '+Value' => (isa => 'Bool');
  has stringy => (is => 'ro', required => 1, isa => 'Bool');
  override as_hashref => sub {
    my $self = shift;
    if ($self->stringy){
      return ($self->Value)?'true':'false';
    } else {
      return ($self->Value)?JSON->true:JSON->false;
    }
  }
}

package Cfn::Integer {
  use Moose;
  extends 'Cfn::Value::Primitive';
  has '+Value' => (isa => 'Int');
}

package Cfn::Long {
  use Moose;
  extends 'Cfn::Value::Primitive';
  has '+Value' => (isa => 'Num');
}

package Cfn::String {
  use Moose;
  extends 'Cfn::Value::Primitive';
  has '+Value' => (isa => 'Str');
}

package Cfn::Double {
  use Moose;
  extends 'Cfn::Value::Primitive';
  has '+Value' => (isa => 'Num');
}

package Cfn::Timestamp {
  use Moose;
  extends 'Cfn::Value::Primitive';
  has '+Value' => (isa => 'Str');
}

package Cfn::Resource {
  use Moose;
  # CCfnX::Dependencies is not production ready
  with 'Cfn::Dependencies';

  sub BUILD {
    my $self = shift;

    my $class_name = $self->meta->name;
    $class_name =~ s/^Cfn::Resource:://;

    # If the user is forcing the Type we want to validate
    # that we ended up with a valid object
    if (defined $self->Type) {
       if ($class_name ne $self->Type and $class_name ne 'AWS::CloudFormation::CustomResource') {
         die "Invalid Cfn::Resource"
       }
    } else {
      $self->Type($class_name);
    }
  }

  has Type => (isa => 'Str', is => 'rw');
  has Properties => (isa => 'Cfn::Resource::Properties', is => 'rw');
  has DeletionPolicy => (isa => 'Cfn::Resource::DeletionPolicy', is => 'rw');
  has DependsOn => (isa => 'ArrayRef[Str]|Str', is => 'rw');
  has Condition => (isa => 'Str', is => 'rw');

  sub Property {
    my ($self, $property) = @_;
    return undef if (not defined $self->Properties);
    return $self->Properties->{ $property };
  }

  sub hasAttribute {
    my ($self, $attribute) = @_;
    my @matches = grep { $_ eq $attribute } @{ $self->AttributeList };
    return @matches == 1;
  }

  has AttributeList => (isa => 'ArrayRef[Str]', is => 'ro', lazy => 1, builder => '_build_attributes');

  sub DependsOnList {
    my $self = shift;
    return () if (not defined $self->DependsOn);
    return @{ $self->DependsOn } if (ref($self->DependsOn) eq 'ARRAY');
    return $self->DependsOn;
  }

  has Metadata => (isa => 'Cfn::Value::Hash', is => 'rw', coerce => 1);
  has UpdatePolicy => (isa => 'Cfn::Resource::UpdatePolicy', is => 'rw', coerce => 1);
  has CreationPolicy => (isa => 'HashRef', is => 'rw');

  sub as_hashref {
    my $self = shift;
    my @args = @_;
    return {
      (map { $_ => $self->$_->as_hashref(@args) }
        grep { defined $self->$_ } qw/Properties Metadata UpdatePolicy/),
      (map { $_ => $self->$_ }
        grep { defined $self->$_ } qw/Type DeletionPolicy DependsOn CreationPolicy Condition/),
    }
  }
}

package Cfn::Resource::Properties {
  use Moose;
  sub as_hashref {
    my $self = shift;
    my @args = @_;

    my $ret = {};
    foreach my $att ($self->meta->get_all_attributes) {
      my $el = $att->name;
      if (defined $self->$el) {
        my @ret = $self->$el->as_hashref(@args);
        if (@ret == 1) {
          $ret->{ $el } = $ret[0];
        } else {
          die "A property returned an odd number of values";
        }
      }
    }
    return $ret;
  }

  sub resolve_references_to_logicalid_with {
    my ($self, $logical_id, $object) = @_;
    foreach my $att ($self->meta->get_attribute_list) {
      next if (not defined $self->$att);

      if      ($self->$att->isa('Cfn::Value::Function::Ref')    and $self->$att->LogicalId eq $logical_id) {
        my $func = $self->$att;
        #$self->$att('TBD');   #$object->$objects_ref_prop
        #warn "Resolved TBD $logical_id";
        my @attrs = $object->meta->get_all_attributes;
        my @ref = grep { $_->does('CCfnX::Meta::Attribute::Trait::RefValue') } @attrs;
        if (not @ref) { die $object . " has no RefValue trait. Cannot resolve Ref" }
        else {
          my $property = $ref[0]->name;
          my $value = $object->$property;
          $self->$att($value);
        }
      } elsif ($self->$att->isa('Cfn::Value::Function::GetAtt') and $self->$att->LogicalId eq $logical_id) {
        my $func = $self->$att;
        my $property = $func->Property;
        $self->$att($object->$property);
        warn "Resolved $logical_id $property";
      } elsif ($self->$att->isa('Cfn::Value::Array')) {
        map { resolve_references_to_logicalid_with($_, $logical_id, $object) } @{ $self->$att->Value };
      } elsif ($self->$att->isa('Cfn::Value::Function')) {
        resolve_references_to_logicalid_with($self->$att, $logical_id, $object);
      } elsif ($self->$att->isa('Cfn::Value::Primitive')) {
        # End case. Primitives do nothing
        # This case is important to be here, as it filters out any Primitives for
        # the next if
      } elsif ($self->$att->isa('Cfn::Value')) {
        resolve_references_to_logicalid_with($self->$att, $logical_id, $object);
      } else {
        die "Don't know how to resolve $att on " . $self->$att;
      }
    }
  }
}

package Cfn::Resource::UpdatePolicy {
  use Moose;
  extends 'Cfn::Value::TypedValue';
  has AutoScalingReplacingUpdate => (isa => 'Cfn::Resource::UpdatePolicy::AutoScalingReplacingUpdate', is => 'rw', coerce => 1);
  has AutoScalingRollingUpdate => (isa => 'Cfn::Resource::UpdatePolicy::AutoScalingRollingUpdate', is => 'rw', coerce => 1);
  has AutoScalingAutoScalingScheduledAction => (isa => 'Cfn::Resource::UpdatePolicy::AutoScalingScheduledAction', is => 'rw', coerce => 1);
  has UseOnlineResharding => (isa => 'Cfn::Value::Boolean', is => 'rw', coerce => 1);
}

package Cfn::Resource::UpdatePolicy::AutoScalingReplacingUpdate {
  use Moose;
  extends 'Cfn::Value::TypedValue';
  has WillReplace => (isa => 'Cfn::Value::Boolean', is => 'rw', required => 1, coerce => 1);
}

package Cfn::Resource::UpdatePolicy::AutoScalingRollingUpdate {
  use Moose;
  extends 'Cfn::Value::TypedValue';
  has MaxBatchSize => (isa => 'Cfn::Value::Integer', is => 'rw', coerce => 1);
  has MinInstancesInService => (isa => 'Cfn::Value::Integer', is => 'rw', coerce => 1);
  has MinSuccessfulInstancesPercent => (isa => 'Cfn::Value::Integer', is =>  'rw', coerce => 1);
  has PauseTime => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1);
  # TODO: better validate SuspendProcesses
  has SuspendProcesses => (isa => 'Cfn::Resource::UpdatePolicy::AutoScalingRollingUpdate::SuspendProcesses', is => 'rw', coerce => 1);
  has WaitOnResourceSignals => (isa => 'Cfn::Value::Boolean', is => 'rw', coerce => 1);
}

package Cfn::Resource::UpdatePolicy::AutoScalingScheduledAction {
  use Moose;
  extends 'Cfn::Value::TypedValue';
  has IgnoreUnmodifiedGroupSizeProperties => (isa => 'Cfn::Value::Boolean', is => 'rw', required => 1, coerce => 1);
}

package Cfn::Output {
  use Moose;
  has Value => (isa => 'Cfn::Value', is => 'rw', required => 1, coerce => 1);
  has Description => (isa => 'Str', is => 'rw');
  has Condition => (isa => 'Str', is => 'rw');
  has Export => (isa => 'Cfn::Value::Hash', is => 'rw', coerce => 1);
  sub as_hashref {
    my $self = shift;
    my @args = @_;
    return {
      Value => $self->Value->as_hashref(@args),
      (defined $self->Condition) ? (Condition => $self->Condition) : (),
      (defined $self->Description) ? (Description => $self->Description) : (),
      (defined $self->Export) ? (Export => $self->Export->as_hashref) : (),
    }
  }
}

package Cfn::Parameter {
  use Moose;
  has Type => (isa => 'Cfn::Parameter::Type', is => 'ro', required => 1);
  has Default => (isa => 'Str', is => 'rw');
  has NoEcho => (isa => 'Str', is => 'rw');
  has AllowedValues  => ( isa => 'ArrayRef[Str]', is => 'rw');
  has AllowedPattern  => ( isa => 'Str', is => 'rw');
  has MaxLength  => ( isa => 'Str', is => 'rw');
  has MinLength  => ( isa => 'Str', is => 'rw');
  has MaxValue  => ( isa => 'Str', is => 'rw');
  has MinValue  => ( isa => 'Str', is => 'rw');
  has Description  => ( isa => 'Str', is => 'rw');
  has ConstraintDescription  => ( isa => 'Str', is => 'rw');

  sub as_hashref {
    my $self = shift;
    return {
      map { (defined $self->$_) ? ($_ => $self->$_) : () }
      qw/Type Default NoEcho AllowedValues AllowedPattern MaxLength
      MinLength MaxValue MinValue Description ConstraintDescription/,
    }
  }
}

package Cfn::Mapping {
  use Moose;
  has Map => (isa => 'HashRef', is => 'ro');

  sub as_hashref {
    my $self = shift;
    return $self->Map;
  }
}

package Cfn::Internal::Options {
  use Moose;
  has custom_resource_rename => (is => 'rw', isa => 'Bool', default => 0);
}

package Cfn {
  use Moose;
  use Moose::Util;
  use Scalar::Util;
  has AWSTemplateFormatVersion => (isa => 'Str', is => 'rw');
  has Description => (isa => 'Str', is => 'rw');
  has Transform => (isa => 'Cfn::Transform', is => 'rw', coerce => 1);

  our $VERSION = '0.01';
  #ABSTRACT: An object model for CloudFormation documents

  has Parameters => (
    is => 'rw',
    isa => 'Cfn::ParameterHash',
    coerce => 1,
    traits => [ 'Hash' ],
    handles => {
      Parameter => 'accessor',
      ParameterCount => 'count',
    },
  );
  has Mappings => (
    is => 'rw',
    isa => 'Cfn::MappingHash',
    coerce => 1,
    traits => [ 'Hash' ],
    handles => {
      Mapping => 'accessor',
      MappingCount => 'count',
    },
  );
  has Conditions => (
    is => 'rw',
    isa => 'Cfn::ConditionHash',
    traits  => [ 'Hash' ],
    coerce => 1,
    handles => {
      Condition => 'accessor',
      ConditionList => 'keys',
      ConditionCount => 'count',
    },
  );
  has Resources => (
    is      => 'rw',
    isa     => 'Cfn::ResourceHash',
    coerce => 1,
    traits  => [ 'Hash' ],
    handles => {
      Resource => 'accessor',
      ResourceList => 'keys',
      ResourceCount => 'count',
    },
  );
  has Outputs => (
    is      => 'rw',
    isa     => 'Cfn::OutputHash',
    coerce  => 1,
    traits  => [ 'Hash' ],
    handles => {
      Output => 'accessor',
      OutputList => 'keys',
      OutputCount => 'count',
    },
  );
  has Metadata => (
    is      => 'rw',
    isa     => 'Cfn::MetadataHash',
    coerce  => 1,
    traits  => [ 'Hash' ],
    handles => {
      MetadataItem => 'accessor',
      MetadataList => 'keys',
      MetadataCount => 'count',
    },
  );

  has cfn_options => (
    is => 'ro',
    isa => 'Cfn::Internal::Options',
    coerce => 1,
    default => sub { Cfn::Internal::Options->new },
  );

  use Module::Runtime qw//;
  sub load_resource_module {
    my (undef, $type) = @_;
    my $cfn_resource_class = "Cfn::Resource::$type";
    my $retval = Module::Runtime::require_module($cfn_resource_class);
    die "Couldn't load $cfn_resource_class" if (not $retval);
    return $cfn_resource_class;
  }

  sub ResourcesOfType {
    my ($self, $type) = @_;
    return grep { $_->Type eq $type } values %{ $self->Resources };
  }

  sub addParameter {
    my ($self, $name, $type, %rest) = @_;
    Moose->throw_error("A parameter named $name already exists") if (defined $self->Parameter($name));
    if (ref $type) {
      return $self->Parameter($name, $type);
    } else {
      return $self->Parameter($name, Cfn::Parameter->new(Type => $type, %rest));
    }
  }

  sub addMapping {
    my ($self, $name, $mapping) = @_;
    Moose->throw_error("A mapping named $name already exists") if (defined $self->Mapping($name));
    if (ref $mapping eq 'HASH') {
      return $self->Mapping($name, Cfn::Mapping->new(Map => $mapping));
    } else {
      return $self->Mapping($name, $mapping);
    }
  }

  sub addOutput {
    my ($self, $name, $output, @rest) = @_;
    Moose->throw_error("An output named $name already exists") if (defined $self->Output($name));
    if (my $class = blessed $output) {
      die "Can't call addOutput with a $class" if ($class ne 'Cfn::Output');
      return $self->Output($name, $output);
    } else {
      return $self->Output($name, Cfn::Output->new( Value => $output, @rest ));
    }
  }

  sub addCondition {
    my ($self, $name, $value) = @_;
    Moose->throw_error("A condition named $name already exists") if (defined $self->Condition($name));
    return $self->Condition($name, Moose::Util::TypeConstraints::find_type_constraint('Cfn::Value')->coerce($value));
  }

  sub addResource {
    my ($self, $name, $second_param, $third_param, @rest) = @_;
    Moose->throw_error("A resource named $name already exists") if (defined $self->Resource($name));

    if (not ref $second_param){
      my $type = $second_param;
      my (@properties, @extra_props);

      if (ref($third_param) eq 'HASH') {
        @properties = %$third_param;
        if (not defined $rest[0]){
          @extra_props = ();
        } elsif (defined $rest[0] and ref($rest[0]) eq 'HASH') {
          @extra_props = %{ $rest[0] }
        } else {
          die "Don't know what to do with the fourth parameter to addResource";
        }
      } else {
        @properties = ( $third_param // () , @rest);
        @extra_props = ();
      }

      return $self->Resources->{ $name } = Moose::Util::TypeConstraints::find_type_constraint('Cfn::Resource')->coerce({
          Type => $type,
          Properties => { @properties },
          @extra_props,
        })
    } else {
      my $object = $second_param;
      return $self->Resource($name, $object);
    }
  }

  sub addMetadata {
    my ($self, $name, $metadata) = @_;

    if (ref($name) eq 'HASH') {
      Moose->throw_error("The stack already has metadata") if (defined $self->Metadata);
      $self->Metadata($name);
    } else {
      Moose->throw_error("A metadata item named $name already exists") if (defined $self->MetadataItem($name));
      return $self->MetadataItem($name, Moose::Util::TypeConstraints::find_type_constraint('Cfn::Value')->coerce($metadata));
    }
  }

  sub addResourceMetadata {
    my ($self, $name, %args) = @_;
    Moose->throw_error("A resource named $name must already exist") if (not defined $self->Resources->{ $name });
    $self->Resources->{ $name }->Metadata({ %args });
  }
  sub addDependsOn {
    my ($self, $name, @args) = @_;
    Moose->throw_error("A resource named $name must already exist") if (not defined $self->Resources->{ $name });
    $self->Resources->{ $name }->DependsOn( [ @args ] );
  }
  sub addDeletionPolicy {
    my ($self, $name, $policy) = @_;
    Moose->throw_error("A resource named $name must already exist") if (not defined $self->Resources->{ $name });
    $self->Resources->{ $name }->DeletionPolicy( $policy );
  }
  sub addUpdatePolicy {
    my ($self, $name, $policy) = @_;
    Moose->throw_error("A resource named $name must already exist") if (not defined $self->Resources->{ $name });
    $self->Resources->{ $name }->UpdatePolicy( Moose::Util::TypeConstraints::find_type_constraint('Cfn::Resource:UpdatePolicy')->coerce($policy) );
  }

  sub addTransform {
    my ($self, $name, $transform) = @_;
    if ( not defined $self->Transform) { $self->Transform([]) };
    push @{$self->Transform}, @{$transform};
  }

  sub from_hashref {
    my ($class, $hashref) = @_;
    return $class->new(%$hashref);
  }

  sub as_hashref {
    my $self = shift;
    return {
      (defined $self->AWSTemplateFormatVersion)?(AWSTemplateFormatVersion => $self->AWSTemplateFormatVersion):(),
      (defined $self->Description)?(Description => $self->Description):(),
      (defined $self->Transform) ? (Transform => $self->Transform) : (),
      (defined $self->Mappings)?(Mappings => { map { ($_ => $self->Mappings->{ $_ }->as_hashref) } keys %{ $self->Mappings } }):(),
      (defined $self->Parameters)?(Parameters => { map { ($_ => $self->Parameters->{ $_ }->as_hashref) } keys %{ $self->Parameters } }):(),
      (defined $self->Outputs)?(Outputs => { map { ($_ => $self->Outputs->{ $_ }->as_hashref($self)) } keys %{ $self->Outputs } }):(),
      (defined $self->Conditions)?(Conditions => { map { ($_ => $self->Condition($_)->as_hashref($self)) } $self->ConditionList }):(),
      (defined $self->Metadata)?(Metadata => { map { ($_ => $self->Metadata->{ $_ }->as_hashref($self)) } $self->MetadataList }):(),
      Resources => { map { ($_ => $self->Resource($_)->as_hashref($self)) } $self->ResourceList },
    }
  }

  has json => (is => 'ro', lazy => 1, default => sub {
      require JSON::MaybeXS;
      return JSON::MaybeXS->new->canonical
    });

  sub as_json {
    my $self = shift;
    my $href = $self->as_hashref;
    return $self->json->encode($href);
  }

  sub from_json {
    my ($class, $json) = @_;

    require JSON::MaybeXS;
    return $class->from_hashref(JSON::MaybeXS::from_json($json));
  }
}

package Cfn::MutabilityTrait {
  use Moose::Role;
  use Moose::Util;
  Moose::Util::meta_attribute_alias('CfnMutability');
  has mutability => (is => 'ro', isa => 'Str', required => 1);
}

package Cfn::Resource::Properties::Tag {
  use Moose;
  extends 'Cfn::Value::TypedValue';
  has Key => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
  has Value => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

1;
