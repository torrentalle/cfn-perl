# AWS::MSK::Cluster generated from spec 14.3.0
use Moose::Util::TypeConstraints;

coerce 'Cfn::Resource::Properties::AWS::MSK::Cluster',
  from 'HashRef',
   via { Cfn::Resource::Properties::AWS::MSK::Cluster->new( %$_ ) };

package Cfn::Resource::AWS::MSK::Cluster {
  use Moose;
  extends 'Cfn::Resource';
  has Properties => (isa => 'Cfn::Resource::Properties::AWS::MSK::Cluster', is => 'rw', coerce => 1);
  
  sub AttributeList {
    [  ]
  }
  sub supported_regions {
    [ 'ap-east-1','ap-northeast-1','ap-northeast-2','ap-south-1','ap-southeast-1','ap-southeast-2','ca-central-1','cn-north-1','cn-northwest-1','eu-central-1','eu-north-1','eu-west-1','eu-west-2','eu-west-3','me-south-1','sa-east-1','us-east-1','us-east-2','us-gov-east-1','us-gov-west-1','us-west-1','us-west-2' ]
  }
}



subtype 'Cfn::Resource::Properties::AWS::MSK::Cluster::S3',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::MSK::Cluster::S3',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::MSK::Cluster::S3Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::MSK::Cluster::S3Value {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Bucket => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Enabled => (isa => 'Cfn::Value::Boolean', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Prefix => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::MSK::Cluster::NodeExporter',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::MSK::Cluster::NodeExporter',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::MSK::Cluster::NodeExporterValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::MSK::Cluster::NodeExporterValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has EnabledInBroker => (isa => 'Cfn::Value::Boolean', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::MSK::Cluster::JmxExporter',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::MSK::Cluster::JmxExporter',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::MSK::Cluster::JmxExporterValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::MSK::Cluster::JmxExporterValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has EnabledInBroker => (isa => 'Cfn::Value::Boolean', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::MSK::Cluster::Firehose',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::MSK::Cluster::Firehose',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::MSK::Cluster::FirehoseValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::MSK::Cluster::FirehoseValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has DeliveryStream => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Enabled => (isa => 'Cfn::Value::Boolean', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::MSK::Cluster::EBSStorageInfo',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::MSK::Cluster::EBSStorageInfo',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::MSK::Cluster::EBSStorageInfoValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::MSK::Cluster::EBSStorageInfoValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has VolumeSize => (isa => 'Cfn::Value::Integer', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
}

subtype 'Cfn::Resource::Properties::AWS::MSK::Cluster::CloudWatchLogs',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::MSK::Cluster::CloudWatchLogs',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::MSK::Cluster::CloudWatchLogsValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::MSK::Cluster::CloudWatchLogsValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Enabled => (isa => 'Cfn::Value::Boolean', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has LogGroup => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::MSK::Cluster::Tls',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::MSK::Cluster::Tls',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::MSK::Cluster::TlsValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::MSK::Cluster::TlsValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has CertificateAuthorityArnList => (isa => 'Cfn::Value::Array|Cfn::Value::Function|Cfn::DynamicValue', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
}

subtype 'Cfn::Resource::Properties::AWS::MSK::Cluster::StorageInfo',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::MSK::Cluster::StorageInfo',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::MSK::Cluster::StorageInfoValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::MSK::Cluster::StorageInfoValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has EBSStorageInfo => (isa => 'Cfn::Resource::Properties::AWS::MSK::Cluster::EBSStorageInfo', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
}

subtype 'Cfn::Resource::Properties::AWS::MSK::Cluster::Prometheus',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::MSK::Cluster::Prometheus',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::MSK::Cluster::PrometheusValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::MSK::Cluster::PrometheusValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has JmxExporter => (isa => 'Cfn::Resource::Properties::AWS::MSK::Cluster::JmxExporter', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has NodeExporter => (isa => 'Cfn::Resource::Properties::AWS::MSK::Cluster::NodeExporter', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::MSK::Cluster::EncryptionInTransit',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::MSK::Cluster::EncryptionInTransit',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::MSK::Cluster::EncryptionInTransitValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::MSK::Cluster::EncryptionInTransitValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has ClientBroker => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
  has InCluster => (isa => 'Cfn::Value::Boolean', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
}

subtype 'Cfn::Resource::Properties::AWS::MSK::Cluster::EncryptionAtRest',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::MSK::Cluster::EncryptionAtRest',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::MSK::Cluster::EncryptionAtRestValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::MSK::Cluster::EncryptionAtRestValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has DataVolumeKMSKeyId => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
}

subtype 'Cfn::Resource::Properties::AWS::MSK::Cluster::BrokerLogs',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::MSK::Cluster::BrokerLogs',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::MSK::Cluster::BrokerLogsValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::MSK::Cluster::BrokerLogsValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has CloudWatchLogs => (isa => 'Cfn::Resource::Properties::AWS::MSK::Cluster::CloudWatchLogs', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Firehose => (isa => 'Cfn::Resource::Properties::AWS::MSK::Cluster::Firehose', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has S3 => (isa => 'Cfn::Resource::Properties::AWS::MSK::Cluster::S3', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::MSK::Cluster::OpenMonitoring',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::MSK::Cluster::OpenMonitoring',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::MSK::Cluster::OpenMonitoringValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::MSK::Cluster::OpenMonitoringValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Prometheus => (isa => 'Cfn::Resource::Properties::AWS::MSK::Cluster::Prometheus', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::MSK::Cluster::LoggingInfo',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::MSK::Cluster::LoggingInfo',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::MSK::Cluster::LoggingInfoValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::MSK::Cluster::LoggingInfoValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has BrokerLogs => (isa => 'Cfn::Resource::Properties::AWS::MSK::Cluster::BrokerLogs', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::MSK::Cluster::EncryptionInfo',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::MSK::Cluster::EncryptionInfo',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::MSK::Cluster::EncryptionInfoValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::MSK::Cluster::EncryptionInfoValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has EncryptionAtRest => (isa => 'Cfn::Resource::Properties::AWS::MSK::Cluster::EncryptionAtRest', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
  has EncryptionInTransit => (isa => 'Cfn::Resource::Properties::AWS::MSK::Cluster::EncryptionInTransit', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
}

subtype 'Cfn::Resource::Properties::AWS::MSK::Cluster::ConfigurationInfo',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::MSK::Cluster::ConfigurationInfo',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::MSK::Cluster::ConfigurationInfoValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::MSK::Cluster::ConfigurationInfoValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Arn => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
  has Revision => (isa => 'Cfn::Value::Integer', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
}

subtype 'Cfn::Resource::Properties::AWS::MSK::Cluster::ClientAuthentication',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::MSK::Cluster::ClientAuthentication',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::MSK::Cluster::ClientAuthenticationValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::MSK::Cluster::ClientAuthenticationValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Tls => (isa => 'Cfn::Resource::Properties::AWS::MSK::Cluster::Tls', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
}

subtype 'Cfn::Resource::Properties::AWS::MSK::Cluster::BrokerNodeGroupInfo',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::MSK::Cluster::BrokerNodeGroupInfo',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::MSK::Cluster::BrokerNodeGroupInfoValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::MSK::Cluster::BrokerNodeGroupInfoValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has BrokerAZDistribution => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
  has ClientSubnets => (isa => 'Cfn::Value::Array|Cfn::Value::Function|Cfn::DynamicValue', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
  has InstanceType => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
  has SecurityGroups => (isa => 'Cfn::Value::Array|Cfn::Value::Function|Cfn::DynamicValue', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
  has StorageInfo => (isa => 'Cfn::Resource::Properties::AWS::MSK::Cluster::StorageInfo', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
}

package Cfn::Resource::Properties::AWS::MSK::Cluster {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Resource::Properties';
  
  has BrokerNodeGroupInfo => (isa => 'Cfn::Resource::Properties::AWS::MSK::Cluster::BrokerNodeGroupInfo', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
  has ClientAuthentication => (isa => 'Cfn::Resource::Properties::AWS::MSK::Cluster::ClientAuthentication', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
  has ClusterName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
  has ConfigurationInfo => (isa => 'Cfn::Resource::Properties::AWS::MSK::Cluster::ConfigurationInfo', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
  has EncryptionInfo => (isa => 'Cfn::Resource::Properties::AWS::MSK::Cluster::EncryptionInfo', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
  has EnhancedMonitoring => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has KafkaVersion => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
  has LoggingInfo => (isa => 'Cfn::Resource::Properties::AWS::MSK::Cluster::LoggingInfo', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has NumberOfBrokerNodes => (isa => 'Cfn::Value::Integer', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has OpenMonitoring => (isa => 'Cfn::Resource::Properties::AWS::MSK::Cluster::OpenMonitoring', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Tags => (isa => 'Cfn::Value::Json|Cfn::DynamicValue', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
}

1;
### main pod documentation begin ###

=encoding UTF-8

=head1 NAME

Cfn::Resource::AWS::MSK::Cluster - Cfn resource for AWS::MSK::Cluster

=head1 DESCRIPTION

This module implements a Perl module that represents the CloudFormation object AWS::MSK::Cluster.

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
