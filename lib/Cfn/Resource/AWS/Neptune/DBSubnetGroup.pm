# AWS::Neptune::DBSubnetGroup generated from spec 2.4.0
use Moose::Util::TypeConstraints;

coerce 'Cfn::Resource::Properties::AWS::Neptune::DBSubnetGroup',
  from 'HashRef',
   via { Cfn::Resource::Properties::AWS::Neptune::DBSubnetGroup->new( %$_ ) };

package Cfn::Resource::AWS::Neptune::DBSubnetGroup {
  use Moose;
  extends 'Cfn::Resource';
  has Properties => (isa => 'Cfn::Resource::Properties::AWS::Neptune::DBSubnetGroup', is => 'rw', coerce => 1);
  sub _build_attributes {
    [  ]
  }
}



package Cfn::Resource::Properties::AWS::Neptune::DBSubnetGroup {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Resource::Properties';
  
  has DBSubnetGroupDescription => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has DBSubnetGroupName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
  has SubnetIds => (isa => 'Cfn::Value::Array|Cfn::Value::Function', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Tags => (isa => 'ArrayOfCfn::Resource::Properties::TagType', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

1;
