# AWS::Cognito::IdentityPoolRoleAttachment generated from spec 14.3.0
use Moose::Util::TypeConstraints;

coerce 'Cfn::Resource::Properties::AWS::Cognito::IdentityPoolRoleAttachment',
  from 'HashRef',
   via { Cfn::Resource::Properties::AWS::Cognito::IdentityPoolRoleAttachment->new( %$_ ) };

package Cfn::Resource::AWS::Cognito::IdentityPoolRoleAttachment {
  use Moose;
  extends 'Cfn::Resource';
  has Properties => (isa => 'Cfn::Resource::Properties::AWS::Cognito::IdentityPoolRoleAttachment', is => 'rw', coerce => 1);
  
  sub AttributeList {
    [  ]
  }
  sub supported_regions {
    [ 'ap-northeast-1','ap-northeast-2','ap-south-1','ap-southeast-1','ap-southeast-2','ca-central-1','eu-central-1','eu-west-1','eu-west-2','us-east-1','us-east-2','us-west-2' ]
  }
}


subtype 'ArrayOfCfn::Resource::Properties::AWS::Cognito::IdentityPoolRoleAttachment::MappingRule',
     as 'Cfn::Value',
  where { $_->isa('Cfn::Value::Array') or $_->isa('Cfn::Value::Function') },
message { "$_ is not a Cfn::Value or a Cfn::Value::Function" };

coerce 'ArrayOfCfn::Resource::Properties::AWS::Cognito::IdentityPoolRoleAttachment::MappingRule',
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
         Moose::Util::TypeConstraints::find_type_constraint('Cfn::Resource::Properties::AWS::Cognito::IdentityPoolRoleAttachment::MappingRule')->coerce($_)
       } @$_
     ]);
   };

subtype 'Cfn::Resource::Properties::AWS::Cognito::IdentityPoolRoleAttachment::MappingRule',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::Cognito::IdentityPoolRoleAttachment::MappingRule',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::Cognito::IdentityPoolRoleAttachment::MappingRuleValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::Cognito::IdentityPoolRoleAttachment::MappingRuleValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Claim => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has MatchType => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has RoleARN => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Value => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::Cognito::IdentityPoolRoleAttachment::RulesConfigurationType',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::Cognito::IdentityPoolRoleAttachment::RulesConfigurationType',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::Cognito::IdentityPoolRoleAttachment::RulesConfigurationTypeValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::Cognito::IdentityPoolRoleAttachment::RulesConfigurationTypeValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Rules => (isa => 'ArrayOfCfn::Resource::Properties::AWS::Cognito::IdentityPoolRoleAttachment::MappingRule', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::Cognito::IdentityPoolRoleAttachment::RoleMapping',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::Cognito::IdentityPoolRoleAttachment::RoleMapping',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::Cognito::IdentityPoolRoleAttachment::RoleMappingValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::Cognito::IdentityPoolRoleAttachment::RoleMappingValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has AmbiguousRoleResolution => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has IdentityProvider => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has RulesConfiguration => (isa => 'Cfn::Resource::Properties::AWS::Cognito::IdentityPoolRoleAttachment::RulesConfigurationType', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Type => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

package Cfn::Resource::Properties::AWS::Cognito::IdentityPoolRoleAttachment {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Resource::Properties';
  
  has IdentityPoolId => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
  has RoleMappings => (isa => 'Cfn::Value::Json|Cfn::DynamicValue', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Roles => (isa => 'Cfn::Value::Json|Cfn::DynamicValue', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

1;
### main pod documentation begin ###

=encoding UTF-8

=head1 NAME

Cfn::Resource::AWS::Cognito::IdentityPoolRoleAttachment - Cfn resource for AWS::Cognito::IdentityPoolRoleAttachment

=head1 DESCRIPTION

This module implements a Perl module that represents the CloudFormation object AWS::Cognito::IdentityPoolRoleAttachment.

See L<Cfn> for more information on how to use it.

=head1 AUTHOR

    Jose Luis Martinez
    CAPSiDE
    jlmartinez@capside.com

=head1 COPYRIGHT and LICENSE

Copyright (c) 2013 by CAPSiDE
This code is distributed under the Apache 2 License. The full text of the 
license can be found in the LICENSE file included with this module.

=cut
