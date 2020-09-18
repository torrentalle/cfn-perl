# AWS::SageMaker::MonitoringSchedule generated from spec 18.0.0
use Moose::Util::TypeConstraints;

coerce 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule',
  from 'HashRef',
   via { Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule->new( %$_ ) };

package Cfn::Resource::AWS::SageMaker::MonitoringSchedule {
  use Moose;
  extends 'Cfn::Resource';
  has Properties => (isa => 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule', is => 'rw', coerce => 1);
  
  sub AttributeList {
    [  ]
  }
  sub supported_regions {
    [ 'ap-east-1','ap-northeast-1','ap-northeast-2','ap-south-1','ap-southeast-1','ap-southeast-2','ca-central-1','cn-north-1','cn-northwest-1','eu-central-1','eu-north-1','eu-west-1','eu-west-2','eu-west-3','me-south-1','sa-east-1','us-east-1','us-east-2','us-west-1','us-west-2' ]
  }
}



subtype 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::S3Output',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::S3Output',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::S3OutputValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::S3OutputValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has LocalPath => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has S3UploadMode => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has S3Uri => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::EndpointInput',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::EndpointInput',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::EndpointInputValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::EndpointInputValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has EndpointName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has LocalPath => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has S3DataDistributionType => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has S3InputMode => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::VpcConfig',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::VpcConfig',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::VpcConfigValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::VpcConfigValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has SecurityGroupIds => (isa => 'Cfn::Value::Array|Cfn::Value::Function|Cfn::DynamicValue', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Subnets => (isa => 'Cfn::Value::Array|Cfn::Value::Function|Cfn::DynamicValue', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::StatisticsResource',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::StatisticsResource',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::StatisticsResourceValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::StatisticsResourceValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has S3Uri => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}
subtype 'ArrayOfCfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringOutput',
     as 'Cfn::Value',
  where { $_->isa('Cfn::Value::Array') or $_->isa('Cfn::Value::Function') },
message { "$_ is not a Cfn::Value or a Cfn::Value::Function" };

coerce 'ArrayOfCfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringOutput',
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
         Moose::Util::TypeConstraints::find_type_constraint('Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringOutput')->coerce($_)
       } @$_
     ]);
   };

subtype 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringOutput',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringOutput',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringOutputValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringOutputValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has S3Output => (isa => 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::S3Output', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}
subtype 'ArrayOfCfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringInput',
     as 'Cfn::Value',
  where { $_->isa('Cfn::Value::Array') or $_->isa('Cfn::Value::Function') },
message { "$_ is not a Cfn::Value or a Cfn::Value::Function" };

coerce 'ArrayOfCfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringInput',
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
         Moose::Util::TypeConstraints::find_type_constraint('Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringInput')->coerce($_)
       } @$_
     ]);
   };

subtype 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringInput',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringInput',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringInputValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringInputValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has EndpointInput => (isa => 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::EndpointInput', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::ConstraintsResource',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::ConstraintsResource',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::ConstraintsResourceValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::ConstraintsResourceValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has S3Uri => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::ClusterConfig',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::ClusterConfig',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::ClusterConfigValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::ClusterConfigValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has InstanceCount => (isa => 'Cfn::Value::Integer', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has InstanceType => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has VolumeKmsKeyId => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has VolumeSizeInGB => (isa => 'Cfn::Value::Integer', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::StoppingCondition',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::StoppingCondition',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::StoppingConditionValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::StoppingConditionValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has MaxRuntimeInSeconds => (isa => 'Cfn::Value::Integer', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::NetworkConfig',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::NetworkConfig',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::NetworkConfigValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::NetworkConfigValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has EnableInterContainerTrafficEncryption => (isa => 'Cfn::Value::Boolean', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has EnableNetworkIsolation => (isa => 'Cfn::Value::Boolean', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has VpcConfig => (isa => 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::VpcConfig', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringResources',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringResources',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringResourcesValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringResourcesValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has ClusterConfig => (isa => 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::ClusterConfig', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringOutputConfig',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringOutputConfig',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringOutputConfigValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringOutputConfigValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has KmsKeyId => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has MonitoringOutputs => (isa => 'ArrayOfCfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringOutput', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringInputs',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringInputs',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringInputsValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringInputsValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has MonitoringInputs => (isa => 'ArrayOfCfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringInput', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringAppSpecification',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringAppSpecification',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringAppSpecificationValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringAppSpecificationValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has ContainerArguments => (isa => 'Cfn::Value::Array|Cfn::Value::Function|Cfn::DynamicValue', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ContainerEntrypoint => (isa => 'Cfn::Value::Array|Cfn::Value::Function|Cfn::DynamicValue', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ImageUri => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has PostAnalyticsProcessorSourceUri => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has RecordPreprocessorSourceUri => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::Environment',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::Environment',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::EnvironmentValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::EnvironmentValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
}

subtype 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::BaselineConfig',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::BaselineConfig',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::BaselineConfigValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::BaselineConfigValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has ConstraintsResource => (isa => 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::ConstraintsResource', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has StatisticsResource => (isa => 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::StatisticsResource', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::ScheduleConfig',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::ScheduleConfig',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::ScheduleConfigValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::ScheduleConfigValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has ScheduleExpression => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringJobDefinition',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringJobDefinition',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringJobDefinitionValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringJobDefinitionValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has BaselineConfig => (isa => 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::BaselineConfig', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Environment => (isa => 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::Environment', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has MonitoringAppSpecification => (isa => 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringAppSpecification', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has MonitoringInputs => (isa => 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringInputs', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has MonitoringOutputConfig => (isa => 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringOutputConfig', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has MonitoringResources => (isa => 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringResources', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has NetworkConfig => (isa => 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::NetworkConfig', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has RoleArn => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has StoppingCondition => (isa => 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::StoppingCondition', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringScheduleConfig',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringScheduleConfig',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringScheduleConfigValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringScheduleConfigValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has MonitoringJobDefinition => (isa => 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringJobDefinition', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ScheduleConfig => (isa => 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::ScheduleConfig', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringExecutionSummary',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringExecutionSummary',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringExecutionSummaryValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringExecutionSummaryValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has CreationTime => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has EndpointName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has FailureReason => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has LastModifiedTime => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has MonitoringExecutionStatus => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has MonitoringScheduleName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ProcessingJobArn => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ScheduledTime => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

package Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Resource::Properties';
  
  has CreationTime => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has EndpointName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has FailureReason => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has LastModifiedTime => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has LastMonitoringExecutionSummary => (isa => 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringExecutionSummary', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has MonitoringScheduleArn => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has MonitoringScheduleConfig => (isa => 'Cfn::Resource::Properties::AWS::SageMaker::MonitoringSchedule::MonitoringScheduleConfig', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has MonitoringScheduleName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has MonitoringScheduleStatus => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Tags => (isa => 'ArrayOfCfn::Resource::Properties::TagType', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

1;
### main pod documentation begin ###

=encoding UTF-8

=head1 NAME

Cfn::Resource::AWS::SageMaker::MonitoringSchedule - Cfn resource for AWS::SageMaker::MonitoringSchedule

=head1 DESCRIPTION

This module implements a Perl module that represents the CloudFormation object AWS::SageMaker::MonitoringSchedule.

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
