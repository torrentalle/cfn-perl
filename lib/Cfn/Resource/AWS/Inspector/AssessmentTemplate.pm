# AWS::Inspector::AssessmentTemplate generated from spec 2.22.0
use Moose::Util::TypeConstraints;

coerce 'Cfn::Resource::Properties::AWS::Inspector::AssessmentTemplate',
  from 'HashRef',
   via { Cfn::Resource::Properties::AWS::Inspector::AssessmentTemplate->new( %$_ ) };

package Cfn::Resource::AWS::Inspector::AssessmentTemplate {
  use Moose;
  extends 'Cfn::Resource';
  has Properties => (isa => 'Cfn::Resource::Properties::AWS::Inspector::AssessmentTemplate', is => 'rw', coerce => 1);
  sub _build_attributes {
    [ 'Arn' ]
  }
}



package Cfn::Resource::Properties::AWS::Inspector::AssessmentTemplate {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Resource::Properties';
  
  has AssessmentTargetArn => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
  has AssessmentTemplateName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
  has DurationInSeconds => (isa => 'Cfn::Value::Integer', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
  has RulesPackageArns => (isa => 'Cfn::Value::Array|Cfn::Value::Function|Cfn::DynamicValue', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
  has UserAttributesForFindings => (isa => 'ArrayOfCfn::Resource::Properties::TagType', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
}

1;
