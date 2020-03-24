# AWS::NetworkManager::Site generated from spec 11.6.0
use Moose::Util::TypeConstraints;

coerce 'Cfn::Resource::Properties::AWS::NetworkManager::Site',
  from 'HashRef',
   via { Cfn::Resource::Properties::AWS::NetworkManager::Site->new( %$_ ) };

package Cfn::Resource::AWS::NetworkManager::Site {
  use Moose;
  extends 'Cfn::Resource';
  has Properties => (isa => 'Cfn::Resource::Properties::AWS::NetworkManager::Site', is => 'rw', coerce => 1);
  
  sub AttributeList {
    [ 'SiteArn','SiteId' ]
  }
  sub supported_regions {
    [ 'ap-northeast-1','ap-northeast-2','ap-south-1','ap-southeast-1','ap-southeast-2','ca-central-1','eu-central-1','eu-west-1','eu-west-2','eu-west-3','sa-east-1','us-east-1','us-east-2','us-west-1','us-west-2' ]
  }
}



subtype 'Cfn::Resource::Properties::AWS::NetworkManager::Site::Location',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::NetworkManager::Site::Location',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::NetworkManager::Site::LocationValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::NetworkManager::Site::LocationValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Address => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Latitude => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Longitude => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

package Cfn::Resource::Properties::AWS::NetworkManager::Site {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Resource::Properties';
  
  has Description => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has GlobalNetworkId => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
  has Location => (isa => 'Cfn::Resource::Properties::AWS::NetworkManager::Site::Location', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Tags => (isa => 'ArrayOfCfn::Resource::Properties::TagType', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

1;
