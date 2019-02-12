# AWS::Inspector::AssessmentTarget generated from spec 2.20.0
use Moose::Util::TypeConstraints;

coerce 'Cfn::Resource::Properties::AWS::Inspector::AssessmentTarget',
  from 'HashRef',
   via { Cfn::Resource::Properties::AWS::Inspector::AssessmentTarget->new( %$_ ) };

package Cfn::Resource::AWS::Inspector::AssessmentTarget {
  use Moose;
  extends 'Cfn::Resource';
  has Properties => (isa => 'Cfn::Resource::Properties::AWS::Inspector::AssessmentTarget', is => 'rw', coerce => 1);
  sub _build_attributes {
    [ 'Arn' ]
  }
}



package Cfn::Resource::Properties::AWS::Inspector::AssessmentTarget {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Resource::Properties';
  
  has AssessmentTargetName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
  has ResourceGroupArn => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

1;
