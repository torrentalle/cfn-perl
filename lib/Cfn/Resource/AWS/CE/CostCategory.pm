# AWS::CE::CostCategory generated from spec 14.3.0
use Moose::Util::TypeConstraints;

coerce 'Cfn::Resource::Properties::AWS::CE::CostCategory',
  from 'HashRef',
   via { Cfn::Resource::Properties::AWS::CE::CostCategory->new( %$_ ) };

package Cfn::Resource::AWS::CE::CostCategory {
  use Moose;
  extends 'Cfn::Resource';
  has Properties => (isa => 'Cfn::Resource::Properties::AWS::CE::CostCategory', is => 'rw', coerce => 1);
  
  sub AttributeList {
    [ 'Arn','EffectiveStart' ]
  }
  sub supported_regions {
    [ 'us-east-1' ]
  }
}



package Cfn::Resource::Properties::AWS::CE::CostCategory {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Resource::Properties';
  
  has Name => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
  has RuleVersion => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Rules => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

1;
