# AWS::AppFlow::Flow generated from spec 18.4.0
use Moose::Util::TypeConstraints;

coerce 'Cfn::Resource::Properties::AWS::AppFlow::Flow',
  from 'HashRef',
   via { Cfn::Resource::Properties::AWS::AppFlow::Flow->new( %$_ ) };

package Cfn::Resource::AWS::AppFlow::Flow {
  use Moose;
  extends 'Cfn::Resource';
  has Properties => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::Flow', is => 'rw', coerce => 1);
  
  sub AttributeList {
    [ 'FlowArn' ]
  }
  sub supported_regions {
    [ 'ap-northeast-1','ap-northeast-2','ap-south-1','ap-southeast-1','ap-southeast-2','ca-central-1','eu-central-1','eu-west-1','eu-west-2','eu-west-3','sa-east-1','us-east-1','us-east-2','us-west-1','us-west-2' ]
  }
}



subtype 'Cfn::Resource::Properties::AWS::AppFlow::Flow::PrefixConfig',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::Flow::PrefixConfig',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::Flow::PrefixConfigValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::Flow::PrefixConfigValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has PrefixFormat => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has PrefixType => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::Flow::AggregationConfig',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::Flow::AggregationConfig',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::Flow::AggregationConfigValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::Flow::AggregationConfigValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has AggregationType => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::Flow::S3OutputFormatConfig',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::Flow::S3OutputFormatConfig',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::Flow::S3OutputFormatConfigValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::Flow::S3OutputFormatConfigValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has AggregationConfig => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::Flow::AggregationConfig', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has FileType => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has PrefixConfig => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::Flow::PrefixConfig', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::Flow::ErrorHandlingConfig',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::Flow::ErrorHandlingConfig',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::Flow::ErrorHandlingConfigValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::Flow::ErrorHandlingConfigValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has BucketName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has BucketPrefix => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has FailOnFirstError => (isa => 'Cfn::Value::Boolean', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::Flow::ZendeskSourceProperties',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::Flow::ZendeskSourceProperties',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::Flow::ZendeskSourcePropertiesValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::Flow::ZendeskSourcePropertiesValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Object => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::Flow::VeevaSourceProperties',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::Flow::VeevaSourceProperties',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::Flow::VeevaSourcePropertiesValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::Flow::VeevaSourcePropertiesValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Object => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::Flow::TrendmicroSourceProperties',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::Flow::TrendmicroSourceProperties',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::Flow::TrendmicroSourcePropertiesValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::Flow::TrendmicroSourcePropertiesValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Object => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::Flow::SnowflakeDestinationProperties',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::Flow::SnowflakeDestinationProperties',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::Flow::SnowflakeDestinationPropertiesValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::Flow::SnowflakeDestinationPropertiesValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has BucketPrefix => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ErrorHandlingConfig => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::Flow::ErrorHandlingConfig', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has IntermediateBucketName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Object => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::Flow::SlackSourceProperties',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::Flow::SlackSourceProperties',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::Flow::SlackSourcePropertiesValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::Flow::SlackSourcePropertiesValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Object => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::Flow::SingularSourceProperties',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::Flow::SingularSourceProperties',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::Flow::SingularSourcePropertiesValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::Flow::SingularSourcePropertiesValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Object => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::Flow::ServiceNowSourceProperties',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::Flow::ServiceNowSourceProperties',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::Flow::ServiceNowSourcePropertiesValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::Flow::ServiceNowSourcePropertiesValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Object => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::Flow::SalesforceSourceProperties',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::Flow::SalesforceSourceProperties',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::Flow::SalesforceSourcePropertiesValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::Flow::SalesforceSourcePropertiesValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has EnableDynamicFieldUpdate => (isa => 'Cfn::Value::Boolean', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has IncludeDeletedRecords => (isa => 'Cfn::Value::Boolean', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Object => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::Flow::SalesforceDestinationProperties',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::Flow::SalesforceDestinationProperties',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::Flow::SalesforceDestinationPropertiesValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::Flow::SalesforceDestinationPropertiesValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has ErrorHandlingConfig => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::Flow::ErrorHandlingConfig', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Object => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::Flow::S3SourceProperties',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::Flow::S3SourceProperties',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::Flow::S3SourcePropertiesValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::Flow::S3SourcePropertiesValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has BucketName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has BucketPrefix => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::Flow::S3DestinationProperties',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::Flow::S3DestinationProperties',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::Flow::S3DestinationPropertiesValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::Flow::S3DestinationPropertiesValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has BucketName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has BucketPrefix => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has S3OutputFormatConfig => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::Flow::S3OutputFormatConfig', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::Flow::RedshiftDestinationProperties',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::Flow::RedshiftDestinationProperties',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::Flow::RedshiftDestinationPropertiesValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::Flow::RedshiftDestinationPropertiesValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has BucketPrefix => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ErrorHandlingConfig => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::Flow::ErrorHandlingConfig', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has IntermediateBucketName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Object => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::Flow::MarketoSourceProperties',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::Flow::MarketoSourceProperties',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::Flow::MarketoSourcePropertiesValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::Flow::MarketoSourcePropertiesValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Object => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::Flow::InforNexusSourceProperties',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::Flow::InforNexusSourceProperties',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::Flow::InforNexusSourcePropertiesValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::Flow::InforNexusSourcePropertiesValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Object => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::Flow::GoogleAnalyticsSourceProperties',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::Flow::GoogleAnalyticsSourceProperties',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::Flow::GoogleAnalyticsSourcePropertiesValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::Flow::GoogleAnalyticsSourcePropertiesValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Object => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::Flow::EventBridgeDestinationProperties',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::Flow::EventBridgeDestinationProperties',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::Flow::EventBridgeDestinationPropertiesValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::Flow::EventBridgeDestinationPropertiesValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has ErrorHandlingConfig => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::Flow::ErrorHandlingConfig', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Object => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::Flow::DynatraceSourceProperties',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::Flow::DynatraceSourceProperties',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::Flow::DynatraceSourcePropertiesValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::Flow::DynatraceSourcePropertiesValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Object => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::Flow::DatadogSourceProperties',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::Flow::DatadogSourceProperties',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::Flow::DatadogSourcePropertiesValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::Flow::DatadogSourcePropertiesValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Object => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::Flow::AmplitudeSourceProperties',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::Flow::AmplitudeSourceProperties',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::Flow::AmplitudeSourcePropertiesValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::Flow::AmplitudeSourcePropertiesValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Object => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}
subtype 'ArrayOfCfn::Resource::Properties::AWS::AppFlow::Flow::TaskPropertiesObject',
     as 'Cfn::Value',
  where { $_->isa('Cfn::Value::Array') or $_->isa('Cfn::Value::Function') },
message { "$_ is not a Cfn::Value or a Cfn::Value::Function" };

coerce 'ArrayOfCfn::Resource::Properties::AWS::AppFlow::Flow::TaskPropertiesObject',
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
         Moose::Util::TypeConstraints::find_type_constraint('Cfn::Resource::Properties::AWS::AppFlow::Flow::TaskPropertiesObject')->coerce($_)
       } @$_
     ]);
   };

subtype 'Cfn::Resource::Properties::AWS::AppFlow::Flow::TaskPropertiesObject',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::Flow::TaskPropertiesObject',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::Flow::TaskPropertiesObjectValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::Flow::TaskPropertiesObjectValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Key => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Value => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::Flow::SourceConnectorProperties',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::Flow::SourceConnectorProperties',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::Flow::SourceConnectorPropertiesValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::Flow::SourceConnectorPropertiesValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Amplitude => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::Flow::AmplitudeSourceProperties', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Datadog => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::Flow::DatadogSourceProperties', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Dynatrace => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::Flow::DynatraceSourceProperties', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has GoogleAnalytics => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::Flow::GoogleAnalyticsSourceProperties', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has InforNexus => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::Flow::InforNexusSourceProperties', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Marketo => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::Flow::MarketoSourceProperties', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has S3 => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::Flow::S3SourceProperties', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Salesforce => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::Flow::SalesforceSourceProperties', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ServiceNow => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::Flow::ServiceNowSourceProperties', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Singular => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::Flow::SingularSourceProperties', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Slack => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::Flow::SlackSourceProperties', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Trendmicro => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::Flow::TrendmicroSourceProperties', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Veeva => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::Flow::VeevaSourceProperties', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Zendesk => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::Flow::ZendeskSourceProperties', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::Flow::ScheduledTriggerProperties',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::Flow::ScheduledTriggerProperties',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::Flow::ScheduledTriggerPropertiesValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::Flow::ScheduledTriggerPropertiesValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has DataPullMode => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ScheduleEndTime => (isa => 'Cfn::Value::Double', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ScheduleExpression => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ScheduleStartTime => (isa => 'Cfn::Value::Double', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has TimeZone => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::Flow::DestinationConnectorProperties',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::Flow::DestinationConnectorProperties',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::Flow::DestinationConnectorPropertiesValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::Flow::DestinationConnectorPropertiesValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has EventBridge => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::Flow::EventBridgeDestinationProperties', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Redshift => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::Flow::RedshiftDestinationProperties', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has S3 => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::Flow::S3DestinationProperties', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Salesforce => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::Flow::SalesforceDestinationProperties', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Snowflake => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::Flow::SnowflakeDestinationProperties', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::Flow::ConnectorOperator',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::Flow::ConnectorOperator',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::Flow::ConnectorOperatorValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::Flow::ConnectorOperatorValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Amplitude => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Datadog => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Dynatrace => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has GoogleAnalytics => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has InforNexus => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Marketo => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has S3 => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Salesforce => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ServiceNow => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Singular => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Slack => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Trendmicro => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Veeva => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Zendesk => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::Flow::TriggerConfig',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::Flow::TriggerConfig',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::Flow::TriggerConfigValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::Flow::TriggerConfigValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has TriggerProperties => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::Flow::ScheduledTriggerProperties', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has TriggerType => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}
subtype 'ArrayOfCfn::Resource::Properties::AWS::AppFlow::Flow::Task',
     as 'Cfn::Value',
  where { $_->isa('Cfn::Value::Array') or $_->isa('Cfn::Value::Function') },
message { "$_ is not a Cfn::Value or a Cfn::Value::Function" };

coerce 'ArrayOfCfn::Resource::Properties::AWS::AppFlow::Flow::Task',
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
         Moose::Util::TypeConstraints::find_type_constraint('Cfn::Resource::Properties::AWS::AppFlow::Flow::Task')->coerce($_)
       } @$_
     ]);
   };

subtype 'Cfn::Resource::Properties::AWS::AppFlow::Flow::Task',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::Flow::Task',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::Flow::TaskValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::Flow::TaskValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has ConnectorOperator => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::Flow::ConnectorOperator', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has DestinationField => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has SourceFields => (isa => 'Cfn::Value::Array|Cfn::Value::Function|Cfn::DynamicValue', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has TaskProperties => (isa => 'ArrayOfCfn::Resource::Properties::AWS::AppFlow::Flow::TaskPropertiesObject', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has TaskType => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::Flow::SourceFlowConfig',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::Flow::SourceFlowConfig',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::Flow::SourceFlowConfigValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::Flow::SourceFlowConfigValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has ConnectorProfileName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ConnectorType => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has SourceConnectorProperties => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::Flow::SourceConnectorProperties', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}
subtype 'ArrayOfCfn::Resource::Properties::AWS::AppFlow::Flow::DestinationFlowConfig',
     as 'Cfn::Value',
  where { $_->isa('Cfn::Value::Array') or $_->isa('Cfn::Value::Function') },
message { "$_ is not a Cfn::Value or a Cfn::Value::Function" };

coerce 'ArrayOfCfn::Resource::Properties::AWS::AppFlow::Flow::DestinationFlowConfig',
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
         Moose::Util::TypeConstraints::find_type_constraint('Cfn::Resource::Properties::AWS::AppFlow::Flow::DestinationFlowConfig')->coerce($_)
       } @$_
     ]);
   };

subtype 'Cfn::Resource::Properties::AWS::AppFlow::Flow::DestinationFlowConfig',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::Flow::DestinationFlowConfig',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::Flow::DestinationFlowConfigValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::Flow::DestinationFlowConfigValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has ConnectorProfileName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ConnectorType => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has DestinationConnectorProperties => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::Flow::DestinationConnectorProperties', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

package Cfn::Resource::Properties::AWS::AppFlow::Flow {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Resource::Properties';
  
  has Description => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has DestinationFlowConfigList => (isa => 'ArrayOfCfn::Resource::Properties::AWS::AppFlow::Flow::DestinationFlowConfig', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has FlowName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
  has KMSArn => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
  has SourceFlowConfig => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::Flow::SourceFlowConfig', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Tags => (isa => 'ArrayOfCfn::Resource::Properties::TagType', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Tasks => (isa => 'ArrayOfCfn::Resource::Properties::AWS::AppFlow::Flow::Task', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has TriggerConfig => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::Flow::TriggerConfig', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

1;
### main pod documentation begin ###

=encoding UTF-8

=head1 NAME

Cfn::Resource::AWS::AppFlow::Flow - Cfn resource for AWS::AppFlow::Flow

=head1 DESCRIPTION

This module implements a Perl module that represents the CloudFormation object AWS::AppFlow::Flow.

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
