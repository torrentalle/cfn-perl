# AWS::Cassandra::Keyspace generated from spec 11.6.0
use Moose::Util::TypeConstraints;

coerce 'Cfn::Resource::Properties::AWS::Cassandra::Keyspace',
  from 'HashRef',
   via { Cfn::Resource::Properties::AWS::Cassandra::Keyspace->new( %$_ ) };

package Cfn::Resource::AWS::Cassandra::Keyspace {
  use Moose;
  extends 'Cfn::Resource';
  has Properties => (isa => 'Cfn::Resource::Properties::AWS::Cassandra::Keyspace', is => 'rw', coerce => 1);
  
  sub AttributeList {
    [  ]
  }
  sub supported_regions {
    [ 'ap-northeast-1','ap-southeast-1','eu-north-1','us-east-1','us-east-2' ]
  }
}



package Cfn::Resource::Properties::AWS::Cassandra::Keyspace {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Resource::Properties';
  
  has KeyspaceName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
}

1;
