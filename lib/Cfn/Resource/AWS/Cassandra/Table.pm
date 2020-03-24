# AWS::Cassandra::Table generated from spec 11.6.0
use Moose::Util::TypeConstraints;

coerce 'Cfn::Resource::Properties::AWS::Cassandra::Table',
  from 'HashRef',
   via { Cfn::Resource::Properties::AWS::Cassandra::Table->new( %$_ ) };

package Cfn::Resource::AWS::Cassandra::Table {
  use Moose;
  extends 'Cfn::Resource';
  has Properties => (isa => 'Cfn::Resource::Properties::AWS::Cassandra::Table', is => 'rw', coerce => 1);
  
  sub AttributeList {
    [  ]
  }
  sub supported_regions {
    [ 'ap-northeast-1','ap-southeast-1','eu-north-1','us-east-1','us-east-2' ]
  }
}



subtype 'Cfn::Resource::Properties::AWS::Cassandra::Table::ProvisionedThroughput',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::Cassandra::Table::ProvisionedThroughput',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::Cassandra::Table::ProvisionedThroughputValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::Cassandra::Table::ProvisionedThroughputValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has ReadCapacityUnits => (isa => 'Cfn::Value::Integer', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has WriteCapacityUnits => (isa => 'Cfn::Value::Integer', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}
subtype 'ArrayOfCfn::Resource::Properties::AWS::Cassandra::Table::Column',
     as 'Cfn::Value',
  where { $_->isa('Cfn::Value::Array') or $_->isa('Cfn::Value::Function') },
message { "$_ is not a Cfn::Value or a Cfn::Value::Function" };

coerce 'ArrayOfCfn::Resource::Properties::AWS::Cassandra::Table::Column',
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
         Moose::Util::TypeConstraints::find_type_constraint('Cfn::Resource::Properties::AWS::Cassandra::Table::Column')->coerce($_)
       } @$_
     ]);
   };

subtype 'Cfn::Resource::Properties::AWS::Cassandra::Table::Column',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::Cassandra::Table::Column',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::Cassandra::Table::ColumnValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::Cassandra::Table::ColumnValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has ColumnName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ColumnType => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}
subtype 'ArrayOfCfn::Resource::Properties::AWS::Cassandra::Table::ClusteringKeyColumn',
     as 'Cfn::Value',
  where { $_->isa('Cfn::Value::Array') or $_->isa('Cfn::Value::Function') },
message { "$_ is not a Cfn::Value or a Cfn::Value::Function" };

coerce 'ArrayOfCfn::Resource::Properties::AWS::Cassandra::Table::ClusteringKeyColumn',
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
         Moose::Util::TypeConstraints::find_type_constraint('Cfn::Resource::Properties::AWS::Cassandra::Table::ClusteringKeyColumn')->coerce($_)
       } @$_
     ]);
   };

subtype 'Cfn::Resource::Properties::AWS::Cassandra::Table::ClusteringKeyColumn',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::Cassandra::Table::ClusteringKeyColumn',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::Cassandra::Table::ClusteringKeyColumnValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::Cassandra::Table::ClusteringKeyColumnValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Column => (isa => 'Cfn::Resource::Properties::AWS::Cassandra::Table::Column', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
  has OrderBy => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
}

subtype 'Cfn::Resource::Properties::AWS::Cassandra::Table::BillingMode',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::Cassandra::Table::BillingMode',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::Cassandra::Table::BillingModeValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::Cassandra::Table::BillingModeValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Mode => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ProvisionedThroughput => (isa => 'Cfn::Resource::Properties::AWS::Cassandra::Table::ProvisionedThroughput', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

package Cfn::Resource::Properties::AWS::Cassandra::Table {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Resource::Properties';
  
  has BillingMode => (isa => 'Cfn::Resource::Properties::AWS::Cassandra::Table::BillingMode', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ClusteringKeyColumns => (isa => 'ArrayOfCfn::Resource::Properties::AWS::Cassandra::Table::ClusteringKeyColumn', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
  has KeyspaceName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
  has PartitionKeyColumns => (isa => 'ArrayOfCfn::Resource::Properties::AWS::Cassandra::Table::Column', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
  has RegularColumns => (isa => 'ArrayOfCfn::Resource::Properties::AWS::Cassandra::Table::Column', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has TableName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
}

1;
