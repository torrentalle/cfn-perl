# AWS::EC2::GatewayRouteTableAssociation generated from spec 10.2.0
use Moose::Util::TypeConstraints;

coerce 'Cfn::Resource::Properties::AWS::EC2::GatewayRouteTableAssociation',
  from 'HashRef',
   via { Cfn::Resource::Properties::AWS::EC2::GatewayRouteTableAssociation->new( %$_ ) };

package Cfn::Resource::AWS::EC2::GatewayRouteTableAssociation {
  use Moose;
  extends 'Cfn::Resource';
  has Properties => (isa => 'Cfn::Resource::Properties::AWS::EC2::GatewayRouteTableAssociation', is => 'rw', coerce => 1);
  
  sub AttributeList {
    [ 'AssociationId' ]
  }
  sub supported_regions {
    [ 'ap-northeast-1','ap-south-1','ap-southeast-1','ap-southeast-2','ca-central-1','eu-central-1','eu-west-1','eu-west-2','eu-west-3','sa-east-1','us-east-1','us-east-2','us-west-1','us-west-2' ]
  }
}



package Cfn::Resource::Properties::AWS::EC2::GatewayRouteTableAssociation {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Resource::Properties';
  
  has GatewayId => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
  has RouteTableId => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

1;
