# AWS::CodeGuruProfiler::ProfilingGroup generated from spec 11.6.0
use Moose::Util::TypeConstraints;

coerce 'Cfn::Resource::Properties::AWS::CodeGuruProfiler::ProfilingGroup',
  from 'HashRef',
   via { Cfn::Resource::Properties::AWS::CodeGuruProfiler::ProfilingGroup->new( %$_ ) };

package Cfn::Resource::AWS::CodeGuruProfiler::ProfilingGroup {
  use Moose;
  extends 'Cfn::Resource';
  has Properties => (isa => 'Cfn::Resource::Properties::AWS::CodeGuruProfiler::ProfilingGroup', is => 'rw', coerce => 1);
  
  sub AttributeList {
    [ 'Arn' ]
  }
  sub supported_regions {
    [ 'ap-southeast-2','eu-west-1','us-east-1','us-east-2','us-west-2' ]
  }
}



package Cfn::Resource::Properties::AWS::CodeGuruProfiler::ProfilingGroup {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Resource::Properties';
  
  has ProfilingGroupName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
}

1;
