# AWS::StepFunctions::Activity generated from spec 2.25.0
use Moose::Util::TypeConstraints;

coerce 'Cfn::Resource::Properties::AWS::StepFunctions::Activity',
  from 'HashRef',
   via { Cfn::Resource::Properties::AWS::StepFunctions::Activity->new( %$_ ) };

package Cfn::Resource::AWS::StepFunctions::Activity {
  use Moose;
  extends 'Cfn::Resource';
  has Properties => (isa => 'Cfn::Resource::Properties::AWS::StepFunctions::Activity', is => 'rw', coerce => 1);
  
  sub AttributeList {
    [ 'Name' ]
  }
  sub supported_regions {
    [ 'ap-northeast-1','eu-central-1','eu-west-1','us-east-1','us-east-2','us-west-2' ]
  }
}



package Cfn::Resource::Properties::AWS::StepFunctions::Activity {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Resource::Properties';
  
  has Name => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
}

1;
