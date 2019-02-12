# AWS::Inspector::ResourceGroup generated from spec 1.12.0
use Moose::Util::TypeConstraints;

coerce 'Cfn::Resource::Properties::AWS::Inspector::ResourceGroup',
  from 'HashRef',
   via { Cfn::Resource::Properties::AWS::Inspector::ResourceGroup->new( %$_ ) };

package Cfn::Resource::AWS::Inspector::ResourceGroup {
  use Moose;
  extends 'Cfn::Resource';
  has Properties => (isa => 'Cfn::Resource::Properties::AWS::Inspector::ResourceGroup', is => 'rw', coerce => 1);
  sub _build_attributes {
    [ 'Arn' ]
  }
}



package Cfn::Resource::Properties::AWS::Inspector::ResourceGroup {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Resource::Properties';
  
  has ResourceGroupTags => (isa => 'ArrayOfCfn::Resource::Properties::TagType', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
}

1;
