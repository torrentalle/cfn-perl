# AWS::LakeFormation::Permissions generated from spec 14.3.0
use Moose::Util::TypeConstraints;

coerce 'Cfn::Resource::Properties::AWS::LakeFormation::Permissions',
  from 'HashRef',
   via { Cfn::Resource::Properties::AWS::LakeFormation::Permissions->new( %$_ ) };

package Cfn::Resource::AWS::LakeFormation::Permissions {
  use Moose;
  extends 'Cfn::Resource';
  has Properties => (isa => 'Cfn::Resource::Properties::AWS::LakeFormation::Permissions', is => 'rw', coerce => 1);
  
  sub AttributeList {
    [  ]
  }
  sub supported_regions {
    [ 'ap-northeast-1','eu-west-1','us-east-1','us-east-2','us-west-2' ]
  }
}



subtype 'Cfn::Resource::Properties::AWS::LakeFormation::Permissions::ColumnWildcard',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::LakeFormation::Permissions::ColumnWildcard',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::LakeFormation::Permissions::ColumnWildcardValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::LakeFormation::Permissions::ColumnWildcardValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has ExcludedColumnNames => (isa => 'Cfn::Value::Array|Cfn::Value::Function|Cfn::DynamicValue', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::LakeFormation::Permissions::TableWithColumnsResource',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::LakeFormation::Permissions::TableWithColumnsResource',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::LakeFormation::Permissions::TableWithColumnsResourceValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::LakeFormation::Permissions::TableWithColumnsResourceValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has ColumnNames => (isa => 'Cfn::Value::Array|Cfn::Value::Function|Cfn::DynamicValue', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ColumnWildcard => (isa => 'Cfn::Resource::Properties::AWS::LakeFormation::Permissions::ColumnWildcard', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has DatabaseName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Name => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::LakeFormation::Permissions::TableResource',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::LakeFormation::Permissions::TableResource',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::LakeFormation::Permissions::TableResourceValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::LakeFormation::Permissions::TableResourceValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has DatabaseName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Name => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::LakeFormation::Permissions::DatabaseResource',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::LakeFormation::Permissions::DatabaseResource',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::LakeFormation::Permissions::DatabaseResourceValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::LakeFormation::Permissions::DatabaseResourceValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Name => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::LakeFormation::Permissions::DataLocationResource',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::LakeFormation::Permissions::DataLocationResource',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::LakeFormation::Permissions::DataLocationResourceValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::LakeFormation::Permissions::DataLocationResourceValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has S3Resource => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::LakeFormation::Permissions::Resource',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::LakeFormation::Permissions::Resource',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::LakeFormation::Permissions::ResourceValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::LakeFormation::Permissions::ResourceValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has DatabaseResource => (isa => 'Cfn::Resource::Properties::AWS::LakeFormation::Permissions::DatabaseResource', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has DataLocationResource => (isa => 'Cfn::Resource::Properties::AWS::LakeFormation::Permissions::DataLocationResource', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has TableResource => (isa => 'Cfn::Resource::Properties::AWS::LakeFormation::Permissions::TableResource', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has TableWithColumnsResource => (isa => 'Cfn::Resource::Properties::AWS::LakeFormation::Permissions::TableWithColumnsResource', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::LakeFormation::Permissions::DataLakePrincipal',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::LakeFormation::Permissions::DataLakePrincipal',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::LakeFormation::Permissions::DataLakePrincipalValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::LakeFormation::Permissions::DataLakePrincipalValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has DataLakePrincipalIdentifier => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

package Cfn::Resource::Properties::AWS::LakeFormation::Permissions {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Resource::Properties';
  
  has DataLakePrincipal => (isa => 'Cfn::Resource::Properties::AWS::LakeFormation::Permissions::DataLakePrincipal', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Permissions => (isa => 'Cfn::Value::Array|Cfn::Value::Function|Cfn::DynamicValue', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has PermissionsWithGrantOption => (isa => 'Cfn::Value::Array|Cfn::Value::Function|Cfn::DynamicValue', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Resource => (isa => 'Cfn::Resource::Properties::AWS::LakeFormation::Permissions::Resource', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

1;
### main pod documentation begin ###

=encoding UTF-8

=head1 NAME

Cfn::Resource::AWS::LakeFormation::Permissions - Cfn resource for AWS::LakeFormation::Permissions

=head1 DESCRIPTION

This module implements a Perl module that represents the CloudFormation object AWS::LakeFormation::Permissions.

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
