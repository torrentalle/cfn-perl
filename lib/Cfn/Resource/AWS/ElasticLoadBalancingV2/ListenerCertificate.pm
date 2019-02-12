# AWS::ElasticLoadBalancingV2::ListenerCertificate generated from spec 1.11.0
use Moose::Util::TypeConstraints;

coerce 'Cfn::Resource::Properties::AWS::ElasticLoadBalancingV2::ListenerCertificate',
  from 'HashRef',
   via { Cfn::Resource::Properties::AWS::ElasticLoadBalancingV2::ListenerCertificate->new( %$_ ) };

package Cfn::Resource::AWS::ElasticLoadBalancingV2::ListenerCertificate {
  use Moose;
  extends 'Cfn::Resource';
  has Properties => (isa => 'Cfn::Resource::Properties::AWS::ElasticLoadBalancingV2::ListenerCertificate', is => 'rw', coerce => 1);
  sub _build_attributes {
    [  ]
  }
}


subtype 'ArrayOfCfn::Resource::Properties::AWS::ElasticLoadBalancingV2::ListenerCertificate::Certificate',
     as 'Cfn::Value',
  where { $_->isa('Cfn::Value::Array') or $_->isa('Cfn::Value::Function') },
message { "$_ is not a Cfn::Value or a Cfn::Value::Function" };

coerce 'ArrayOfCfn::Resource::Properties::AWS::ElasticLoadBalancingV2::ListenerCertificate::Certificate',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       die 'Only accepts functions'; 
     }
   },
  from 'ArrayRef',
   via {
     Cfn::Value::Array->new(Value => [
       map { 
         Moose::Util::TypeConstraints::find_type_constraint('Cfn::Resource::Properties::AWS::ElasticLoadBalancingV2::ListenerCertificate::Certificate')->coerce($_)
       } @$_
     ]);
   };

subtype 'Cfn::Resource::Properties::AWS::ElasticLoadBalancingV2::ListenerCertificate::Certificate',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::ElasticLoadBalancingV2::ListenerCertificate::Certificate',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::ElasticLoadBalancingV2::ListenerCertificate::CertificateValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::ElasticLoadBalancingV2::ListenerCertificate::CertificateValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has CertificateArn => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

package Cfn::Resource::Properties::AWS::ElasticLoadBalancingV2::ListenerCertificate {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Resource::Properties';
  
  has Certificates => (isa => 'ArrayOfCfn::Resource::Properties::AWS::ElasticLoadBalancingV2::ListenerCertificate::Certificate', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
  has ListenerArn => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
}

1;
