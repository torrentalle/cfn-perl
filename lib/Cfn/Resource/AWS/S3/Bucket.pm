# AWS::S3::Bucket generated from spec 18.4.0
use Moose::Util::TypeConstraints;

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket',
  from 'HashRef',
   via { Cfn::Resource::Properties::AWS::S3::Bucket->new( %$_ ) };

package Cfn::Resource::AWS::S3::Bucket {
  use Moose;
  extends 'Cfn::Resource';
  has Properties => (isa => 'Cfn::Resource::Properties::AWS::S3::Bucket', is => 'rw', coerce => 1);
  
  sub AttributeList {
    [ 'Arn','DomainName','DualStackDomainName','RegionalDomainName','WebsiteURL' ]
  }
  sub supported_regions {
    [ 'af-south-1','ap-east-1','ap-northeast-1','ap-northeast-2','ap-northeast-3','ap-south-1','ap-southeast-1','ap-southeast-2','ca-central-1','cn-north-1','cn-northwest-1','eu-central-1','eu-north-1','eu-south-1','eu-west-1','eu-west-2','eu-west-3','me-south-1','sa-east-1','us-east-1','us-east-2','us-gov-east-1','us-gov-west-1','us-west-1','us-west-2' ]
  }
}


subtype 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::TagFilter',
     as 'Cfn::Value',
  where { $_->isa('Cfn::Value::Array') or $_->isa('Cfn::Value::Function') },
message { "$_ is not a Cfn::Value or a Cfn::Value::Function" };

coerce 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::TagFilter',
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
         Moose::Util::TypeConstraints::find_type_constraint('Cfn::Resource::Properties::AWS::S3::Bucket::TagFilter')->coerce($_)
       } @$_
     ]);
   };

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::TagFilter',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::TagFilter',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::TagFilter::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::TagFilter::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Key => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Value => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::ReplicationTimeValue',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::ReplicationTimeValue',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::ReplicationTimeValue::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::ReplicationTimeValue::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Minutes => (isa => 'Cfn::Value::Integer', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}
subtype 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::FilterRule',
     as 'Cfn::Value',
  where { $_->isa('Cfn::Value::Array') or $_->isa('Cfn::Value::Function') },
message { "$_ is not a Cfn::Value or a Cfn::Value::Function" };

coerce 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::FilterRule',
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
         Moose::Util::TypeConstraints::find_type_constraint('Cfn::Resource::Properties::AWS::S3::Bucket::FilterRule')->coerce($_)
       } @$_
     ]);
   };

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::FilterRule',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::FilterRule',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::FilterRule::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::FilterRule::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Name => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Value => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::SseKmsEncryptedObjects',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::SseKmsEncryptedObjects',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::SseKmsEncryptedObjects::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::SseKmsEncryptedObjects::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Status => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::S3KeyFilter',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::S3KeyFilter',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::S3KeyFilter::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::S3KeyFilter::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Rules => (isa => 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::FilterRule', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::ReplicationTime',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::ReplicationTime',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::ReplicationTime::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::ReplicationTime::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Status => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Time => (isa => 'Cfn::Resource::Properties::AWS::S3::Bucket::ReplicationTimeValue', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::ReplicationRuleAndOperator',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::ReplicationRuleAndOperator',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::ReplicationRuleAndOperator::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::ReplicationRuleAndOperator::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Prefix => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has TagFilters => (isa => 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::TagFilter', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::Metrics',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::Metrics',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::Metrics::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::Metrics::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has EventThreshold => (isa => 'Cfn::Resource::Properties::AWS::S3::Bucket::ReplicationTimeValue', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Status => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::EncryptionConfiguration',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::EncryptionConfiguration',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::EncryptionConfiguration::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::EncryptionConfiguration::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has ReplicaKmsKeyID => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::Destination',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::Destination',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::Destination::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::Destination::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has BucketAccountId => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has BucketArn => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Format => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Prefix => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::AccessControlTranslation',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::AccessControlTranslation',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::AccessControlTranslation::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::AccessControlTranslation::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Owner => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}
subtype 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::Transition',
     as 'Cfn::Value',
  where { $_->isa('Cfn::Value::Array') or $_->isa('Cfn::Value::Function') },
message { "$_ is not a Cfn::Value or a Cfn::Value::Function" };

coerce 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::Transition',
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
         Moose::Util::TypeConstraints::find_type_constraint('Cfn::Resource::Properties::AWS::S3::Bucket::Transition')->coerce($_)
       } @$_
     ]);
   };

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::Transition',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::Transition',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::Transition::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::Transition::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has StorageClass => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has TransitionDate => (isa => 'Cfn::Value::Timestamp', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has TransitionInDays => (isa => 'Cfn::Value::Integer', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::SourceSelectionCriteria',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::SourceSelectionCriteria',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::SourceSelectionCriteria::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::SourceSelectionCriteria::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has SseKmsEncryptedObjects => (isa => 'Cfn::Resource::Properties::AWS::S3::Bucket::SseKmsEncryptedObjects', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::ServerSideEncryptionByDefault',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::ServerSideEncryptionByDefault',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::ServerSideEncryptionByDefault::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::ServerSideEncryptionByDefault::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has KMSMasterKeyID => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has SSEAlgorithm => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::RoutingRuleCondition',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::RoutingRuleCondition',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::RoutingRuleCondition::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::RoutingRuleCondition::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has HttpErrorCodeReturnedEquals => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has KeyPrefixEquals => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::ReplicationRuleFilter',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::ReplicationRuleFilter',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::ReplicationRuleFilter::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::ReplicationRuleFilter::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has And => (isa => 'Cfn::Resource::Properties::AWS::S3::Bucket::ReplicationRuleAndOperator', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Prefix => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has TagFilter => (isa => 'Cfn::Resource::Properties::AWS::S3::Bucket::TagFilter', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::ReplicationDestination',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::ReplicationDestination',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::ReplicationDestination::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::ReplicationDestination::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has AccessControlTranslation => (isa => 'Cfn::Resource::Properties::AWS::S3::Bucket::AccessControlTranslation', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Account => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Bucket => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has EncryptionConfiguration => (isa => 'Cfn::Resource::Properties::AWS::S3::Bucket::EncryptionConfiguration', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Metrics => (isa => 'Cfn::Resource::Properties::AWS::S3::Bucket::Metrics', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ReplicationTime => (isa => 'Cfn::Resource::Properties::AWS::S3::Bucket::ReplicationTime', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has StorageClass => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::RedirectRule',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::RedirectRule',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::RedirectRule::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::RedirectRule::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has HostName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has HttpRedirectCode => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Protocol => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ReplaceKeyPrefixWith => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ReplaceKeyWith => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::NotificationFilter',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::NotificationFilter',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::NotificationFilter::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::NotificationFilter::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has S3Key => (isa => 'Cfn::Resource::Properties::AWS::S3::Bucket::S3KeyFilter', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}
subtype 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::NoncurrentVersionTransition',
     as 'Cfn::Value',
  where { $_->isa('Cfn::Value::Array') or $_->isa('Cfn::Value::Function') },
message { "$_ is not a Cfn::Value or a Cfn::Value::Function" };

coerce 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::NoncurrentVersionTransition',
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
         Moose::Util::TypeConstraints::find_type_constraint('Cfn::Resource::Properties::AWS::S3::Bucket::NoncurrentVersionTransition')->coerce($_)
       } @$_
     ]);
   };

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::NoncurrentVersionTransition',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::NoncurrentVersionTransition',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::NoncurrentVersionTransition::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::NoncurrentVersionTransition::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has StorageClass => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has TransitionInDays => (isa => 'Cfn::Value::Integer', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::DeleteMarkerReplication',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::DeleteMarkerReplication',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::DeleteMarkerReplication::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::DeleteMarkerReplication::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Status => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::DefaultRetention',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::DefaultRetention',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::DefaultRetention::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::DefaultRetention::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Days => (isa => 'Cfn::Value::Integer', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Mode => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Years => (isa => 'Cfn::Value::Integer', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::DataExport',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::DataExport',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::DataExport::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::DataExport::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Destination => (isa => 'Cfn::Resource::Properties::AWS::S3::Bucket::Destination', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has OutputSchemaVersion => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::AbortIncompleteMultipartUpload',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::AbortIncompleteMultipartUpload',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::AbortIncompleteMultipartUpload::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::AbortIncompleteMultipartUpload::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has DaysAfterInitiation => (isa => 'Cfn::Value::Integer', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}
subtype 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::TopicConfiguration',
     as 'Cfn::Value',
  where { $_->isa('Cfn::Value::Array') or $_->isa('Cfn::Value::Function') },
message { "$_ is not a Cfn::Value or a Cfn::Value::Function" };

coerce 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::TopicConfiguration',
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
         Moose::Util::TypeConstraints::find_type_constraint('Cfn::Resource::Properties::AWS::S3::Bucket::TopicConfiguration')->coerce($_)
       } @$_
     ]);
   };

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::TopicConfiguration',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::TopicConfiguration',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::TopicConfiguration::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::TopicConfiguration::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Event => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Filter => (isa => 'Cfn::Resource::Properties::AWS::S3::Bucket::NotificationFilter', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Topic => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::StorageClassAnalysis',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::StorageClassAnalysis',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::StorageClassAnalysis::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::StorageClassAnalysis::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has DataExport => (isa => 'Cfn::Resource::Properties::AWS::S3::Bucket::DataExport', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}
subtype 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::ServerSideEncryptionRule',
     as 'Cfn::Value',
  where { $_->isa('Cfn::Value::Array') or $_->isa('Cfn::Value::Function') },
message { "$_ is not a Cfn::Value or a Cfn::Value::Function" };

coerce 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::ServerSideEncryptionRule',
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
         Moose::Util::TypeConstraints::find_type_constraint('Cfn::Resource::Properties::AWS::S3::Bucket::ServerSideEncryptionRule')->coerce($_)
       } @$_
     ]);
   };

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::ServerSideEncryptionRule',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::ServerSideEncryptionRule',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::ServerSideEncryptionRule::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::ServerSideEncryptionRule::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has ServerSideEncryptionByDefault => (isa => 'Cfn::Resource::Properties::AWS::S3::Bucket::ServerSideEncryptionByDefault', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}
subtype 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::Rule',
     as 'Cfn::Value',
  where { $_->isa('Cfn::Value::Array') or $_->isa('Cfn::Value::Function') },
message { "$_ is not a Cfn::Value or a Cfn::Value::Function" };

coerce 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::Rule',
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
         Moose::Util::TypeConstraints::find_type_constraint('Cfn::Resource::Properties::AWS::S3::Bucket::Rule')->coerce($_)
       } @$_
     ]);
   };

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::Rule',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::Rule',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::Rule::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::Rule::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has AbortIncompleteMultipartUpload => (isa => 'Cfn::Resource::Properties::AWS::S3::Bucket::AbortIncompleteMultipartUpload', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ExpirationDate => (isa => 'Cfn::Value::Timestamp', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ExpirationInDays => (isa => 'Cfn::Value::Integer', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Id => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has NoncurrentVersionExpirationInDays => (isa => 'Cfn::Value::Integer', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has NoncurrentVersionTransition => (isa => 'Cfn::Resource::Properties::AWS::S3::Bucket::NoncurrentVersionTransition', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has NoncurrentVersionTransitions => (isa => 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::NoncurrentVersionTransition', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Prefix => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Status => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has TagFilters => (isa => 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::TagFilter', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Transition => (isa => 'Cfn::Resource::Properties::AWS::S3::Bucket::Transition', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Transitions => (isa => 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::Transition', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}
subtype 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::RoutingRule',
     as 'Cfn::Value',
  where { $_->isa('Cfn::Value::Array') or $_->isa('Cfn::Value::Function') },
message { "$_ is not a Cfn::Value or a Cfn::Value::Function" };

coerce 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::RoutingRule',
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
         Moose::Util::TypeConstraints::find_type_constraint('Cfn::Resource::Properties::AWS::S3::Bucket::RoutingRule')->coerce($_)
       } @$_
     ]);
   };

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::RoutingRule',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::RoutingRule',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::RoutingRule::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::RoutingRule::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has RedirectRule => (isa => 'Cfn::Resource::Properties::AWS::S3::Bucket::RedirectRule', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has RoutingRuleCondition => (isa => 'Cfn::Resource::Properties::AWS::S3::Bucket::RoutingRuleCondition', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}
subtype 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::ReplicationRule',
     as 'Cfn::Value',
  where { $_->isa('Cfn::Value::Array') or $_->isa('Cfn::Value::Function') },
message { "$_ is not a Cfn::Value or a Cfn::Value::Function" };

coerce 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::ReplicationRule',
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
         Moose::Util::TypeConstraints::find_type_constraint('Cfn::Resource::Properties::AWS::S3::Bucket::ReplicationRule')->coerce($_)
       } @$_
     ]);
   };

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::ReplicationRule',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::ReplicationRule',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::ReplicationRule::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::ReplicationRule::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has DeleteMarkerReplication => (isa => 'Cfn::Resource::Properties::AWS::S3::Bucket::DeleteMarkerReplication', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Destination => (isa => 'Cfn::Resource::Properties::AWS::S3::Bucket::ReplicationDestination', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Filter => (isa => 'Cfn::Resource::Properties::AWS::S3::Bucket::ReplicationRuleFilter', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Id => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Prefix => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Priority => (isa => 'Cfn::Value::Integer', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has SourceSelectionCriteria => (isa => 'Cfn::Resource::Properties::AWS::S3::Bucket::SourceSelectionCriteria', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Status => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::RedirectAllRequestsTo',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::RedirectAllRequestsTo',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::RedirectAllRequestsTo::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::RedirectAllRequestsTo::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has HostName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Protocol => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}
subtype 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::QueueConfiguration',
     as 'Cfn::Value',
  where { $_->isa('Cfn::Value::Array') or $_->isa('Cfn::Value::Function') },
message { "$_ is not a Cfn::Value or a Cfn::Value::Function" };

coerce 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::QueueConfiguration',
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
         Moose::Util::TypeConstraints::find_type_constraint('Cfn::Resource::Properties::AWS::S3::Bucket::QueueConfiguration')->coerce($_)
       } @$_
     ]);
   };

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::QueueConfiguration',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::QueueConfiguration',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::QueueConfiguration::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::QueueConfiguration::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Event => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Filter => (isa => 'Cfn::Resource::Properties::AWS::S3::Bucket::NotificationFilter', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Queue => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::ObjectLockRule',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::ObjectLockRule',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::ObjectLockRule::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::ObjectLockRule::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has DefaultRetention => (isa => 'Cfn::Resource::Properties::AWS::S3::Bucket::DefaultRetention', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}
subtype 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::LambdaConfiguration',
     as 'Cfn::Value',
  where { $_->isa('Cfn::Value::Array') or $_->isa('Cfn::Value::Function') },
message { "$_ is not a Cfn::Value or a Cfn::Value::Function" };

coerce 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::LambdaConfiguration',
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
         Moose::Util::TypeConstraints::find_type_constraint('Cfn::Resource::Properties::AWS::S3::Bucket::LambdaConfiguration')->coerce($_)
       } @$_
     ]);
   };

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::LambdaConfiguration',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::LambdaConfiguration',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::LambdaConfiguration::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::LambdaConfiguration::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Event => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Filter => (isa => 'Cfn::Resource::Properties::AWS::S3::Bucket::NotificationFilter', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Function => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}
subtype 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::CorsRule',
     as 'Cfn::Value',
  where { $_->isa('Cfn::Value::Array') or $_->isa('Cfn::Value::Function') },
message { "$_ is not a Cfn::Value or a Cfn::Value::Function" };

coerce 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::CorsRule',
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
         Moose::Util::TypeConstraints::find_type_constraint('Cfn::Resource::Properties::AWS::S3::Bucket::CorsRule')->coerce($_)
       } @$_
     ]);
   };

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::CorsRule',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::CorsRule',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::CorsRule::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::CorsRule::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has AllowedHeaders => (isa => 'Cfn::Value::Array|Cfn::Value::Function|Cfn::DynamicValue', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has AllowedMethods => (isa => 'Cfn::Value::Array|Cfn::Value::Function|Cfn::DynamicValue', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has AllowedOrigins => (isa => 'Cfn::Value::Array|Cfn::Value::Function|Cfn::DynamicValue', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ExposedHeaders => (isa => 'Cfn::Value::Array|Cfn::Value::Function|Cfn::DynamicValue', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Id => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has MaxAge => (isa => 'Cfn::Value::Integer', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::WebsiteConfiguration',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::WebsiteConfiguration',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::WebsiteConfiguration::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::WebsiteConfiguration::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has ErrorDocument => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has IndexDocument => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has RedirectAllRequestsTo => (isa => 'Cfn::Resource::Properties::AWS::S3::Bucket::RedirectAllRequestsTo', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has RoutingRules => (isa => 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::RoutingRule', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::VersioningConfiguration',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::VersioningConfiguration',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::VersioningConfiguration::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::VersioningConfiguration::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Status => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::ReplicationConfiguration',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::ReplicationConfiguration',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::ReplicationConfiguration::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::ReplicationConfiguration::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Role => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Rules => (isa => 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::ReplicationRule', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::PublicAccessBlockConfiguration',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::PublicAccessBlockConfiguration',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::PublicAccessBlockConfiguration::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::PublicAccessBlockConfiguration::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has BlockPublicAcls => (isa => 'Cfn::Value::Boolean', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has BlockPublicPolicy => (isa => 'Cfn::Value::Boolean', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has IgnorePublicAcls => (isa => 'Cfn::Value::Boolean', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has RestrictPublicBuckets => (isa => 'Cfn::Value::Boolean', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::ObjectLockConfiguration',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::ObjectLockConfiguration',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::ObjectLockConfiguration::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::ObjectLockConfiguration::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has ObjectLockEnabled => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Rule => (isa => 'Cfn::Resource::Properties::AWS::S3::Bucket::ObjectLockRule', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::NotificationConfiguration',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::NotificationConfiguration',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::NotificationConfiguration::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::NotificationConfiguration::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has LambdaConfigurations => (isa => 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::LambdaConfiguration', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has QueueConfigurations => (isa => 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::QueueConfiguration', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has TopicConfigurations => (isa => 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::TopicConfiguration', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}
subtype 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::MetricsConfiguration',
     as 'Cfn::Value',
  where { $_->isa('Cfn::Value::Array') or $_->isa('Cfn::Value::Function') },
message { "$_ is not a Cfn::Value or a Cfn::Value::Function" };

coerce 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::MetricsConfiguration',
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
         Moose::Util::TypeConstraints::find_type_constraint('Cfn::Resource::Properties::AWS::S3::Bucket::MetricsConfiguration')->coerce($_)
       } @$_
     ]);
   };

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::MetricsConfiguration',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::MetricsConfiguration',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::MetricsConfiguration::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::MetricsConfiguration::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Id => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Prefix => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has TagFilters => (isa => 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::TagFilter', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::LoggingConfiguration',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::LoggingConfiguration',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::LoggingConfiguration::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::LoggingConfiguration::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has DestinationBucketName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has LogFilePrefix => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::LifecycleConfiguration',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::LifecycleConfiguration',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::LifecycleConfiguration::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::LifecycleConfiguration::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Rules => (isa => 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::Rule', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}
subtype 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::InventoryConfiguration',
     as 'Cfn::Value',
  where { $_->isa('Cfn::Value::Array') or $_->isa('Cfn::Value::Function') },
message { "$_ is not a Cfn::Value or a Cfn::Value::Function" };

coerce 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::InventoryConfiguration',
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
         Moose::Util::TypeConstraints::find_type_constraint('Cfn::Resource::Properties::AWS::S3::Bucket::InventoryConfiguration')->coerce($_)
       } @$_
     ]);
   };

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::InventoryConfiguration',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::InventoryConfiguration',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::InventoryConfiguration::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::InventoryConfiguration::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Destination => (isa => 'Cfn::Resource::Properties::AWS::S3::Bucket::Destination', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Enabled => (isa => 'Cfn::Value::Boolean', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Id => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has IncludedObjectVersions => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has OptionalFields => (isa => 'Cfn::Value::Array|Cfn::Value::Function|Cfn::DynamicValue', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Prefix => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ScheduleFrequency => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::CorsConfiguration',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::CorsConfiguration',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::CorsConfiguration::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::CorsConfiguration::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has CorsRules => (isa => 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::CorsRule', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::BucketEncryption',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::BucketEncryption',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::BucketEncryption::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::BucketEncryption::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has ServerSideEncryptionConfiguration => (isa => 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::ServerSideEncryptionRule', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}
subtype 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::AnalyticsConfiguration',
     as 'Cfn::Value',
  where { $_->isa('Cfn::Value::Array') or $_->isa('Cfn::Value::Function') },
message { "$_ is not a Cfn::Value or a Cfn::Value::Function" };

coerce 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::AnalyticsConfiguration',
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
         Moose::Util::TypeConstraints::find_type_constraint('Cfn::Resource::Properties::AWS::S3::Bucket::AnalyticsConfiguration')->coerce($_)
       } @$_
     ]);
   };

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::AnalyticsConfiguration',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::AnalyticsConfiguration',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::AnalyticsConfiguration::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::AnalyticsConfiguration::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Id => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Prefix => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has StorageClassAnalysis => (isa => 'Cfn::Resource::Properties::AWS::S3::Bucket::StorageClassAnalysis', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has TagFilters => (isa => 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::TagFilter', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::S3::Bucket::AccelerateConfiguration',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::S3::Bucket::AccelerateConfiguration',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::S3::Bucket::AccelerateConfiguration::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::S3::Bucket::AccelerateConfiguration::Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has AccelerationStatus => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

package Cfn::Resource::Properties::AWS::S3::Bucket {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Resource::Properties';
  
  has AccelerateConfiguration => (isa => 'Cfn::Resource::Properties::AWS::S3::Bucket::AccelerateConfiguration', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has AccessControl => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has AnalyticsConfigurations => (isa => 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::AnalyticsConfiguration', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has BucketEncryption => (isa => 'Cfn::Resource::Properties::AWS::S3::Bucket::BucketEncryption', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has BucketName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
  has CorsConfiguration => (isa => 'Cfn::Resource::Properties::AWS::S3::Bucket::CorsConfiguration', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has InventoryConfigurations => (isa => 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::InventoryConfiguration', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has LifecycleConfiguration => (isa => 'Cfn::Resource::Properties::AWS::S3::Bucket::LifecycleConfiguration', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has LoggingConfiguration => (isa => 'Cfn::Resource::Properties::AWS::S3::Bucket::LoggingConfiguration', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has MetricsConfigurations => (isa => 'ArrayOfCfn::Resource::Properties::AWS::S3::Bucket::MetricsConfiguration', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has NotificationConfiguration => (isa => 'Cfn::Resource::Properties::AWS::S3::Bucket::NotificationConfiguration', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ObjectLockConfiguration => (isa => 'Cfn::Resource::Properties::AWS::S3::Bucket::ObjectLockConfiguration', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ObjectLockEnabled => (isa => 'Cfn::Value::Boolean', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
  has PublicAccessBlockConfiguration => (isa => 'Cfn::Resource::Properties::AWS::S3::Bucket::PublicAccessBlockConfiguration', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ReplicationConfiguration => (isa => 'Cfn::Resource::Properties::AWS::S3::Bucket::ReplicationConfiguration', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Tags => (isa => 'ArrayOfCfn::Resource::Properties::TagType', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has VersioningConfiguration => (isa => 'Cfn::Resource::Properties::AWS::S3::Bucket::VersioningConfiguration', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has WebsiteConfiguration => (isa => 'Cfn::Resource::Properties::AWS::S3::Bucket::WebsiteConfiguration', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

1;
### main pod documentation begin ###

=encoding UTF-8

=head1 NAME

Cfn::Resource::AWS::S3::Bucket - Cfn resource for AWS::S3::Bucket

=head1 DESCRIPTION

This module implements a Perl module that represents the CloudFormation object AWS::S3::Bucket.

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
