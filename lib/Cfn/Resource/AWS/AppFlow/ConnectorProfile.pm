# AWS::AppFlow::ConnectorProfile generated from spec 18.4.0
use Moose::Util::TypeConstraints;

coerce 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile',
  from 'HashRef',
   via { Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile->new( %$_ ) };

package Cfn::Resource::AWS::AppFlow::ConnectorProfile {
  use Moose;
  extends 'Cfn::Resource';
  has Properties => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile', is => 'rw', coerce => 1);
  
  sub AttributeList {
    [ 'ConnectorProfileArn','CredentialsArn' ]
  }
  sub supported_regions {
    [ 'ap-northeast-1','ap-northeast-2','ap-south-1','ap-southeast-1','ap-southeast-2','ca-central-1','eu-central-1','eu-west-1','eu-west-2','eu-west-3','sa-east-1','us-east-1','us-east-2','us-west-1','us-west-2' ]
  }
}



subtype 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ConnectorOAuthRequest',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ConnectorOAuthRequest',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ConnectorOAuthRequestValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ConnectorOAuthRequestValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has AuthCode => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has RedirectUri => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ZendeskConnectorProfileProperties',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ZendeskConnectorProfileProperties',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ZendeskConnectorProfilePropertiesValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ZendeskConnectorProfilePropertiesValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has InstanceUrl => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ZendeskConnectorProfileCredentials',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ZendeskConnectorProfileCredentials',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ZendeskConnectorProfileCredentialsValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ZendeskConnectorProfileCredentialsValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has AccessToken => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ClientId => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ClientSecret => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ConnectorOAuthRequest => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ConnectorOAuthRequest', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::VeevaConnectorProfileProperties',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::VeevaConnectorProfileProperties',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::VeevaConnectorProfilePropertiesValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::VeevaConnectorProfilePropertiesValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has InstanceUrl => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::VeevaConnectorProfileCredentials',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::VeevaConnectorProfileCredentials',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::VeevaConnectorProfileCredentialsValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::VeevaConnectorProfileCredentialsValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Password => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Username => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::TrendmicroConnectorProfileCredentials',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::TrendmicroConnectorProfileCredentials',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::TrendmicroConnectorProfileCredentialsValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::TrendmicroConnectorProfileCredentialsValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has ApiSecretKey => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SnowflakeConnectorProfileProperties',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SnowflakeConnectorProfileProperties',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SnowflakeConnectorProfilePropertiesValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SnowflakeConnectorProfilePropertiesValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has AccountName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has BucketName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has BucketPrefix => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has PrivateLinkServiceName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Region => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Stage => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Warehouse => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SnowflakeConnectorProfileCredentials',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SnowflakeConnectorProfileCredentials',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SnowflakeConnectorProfileCredentialsValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SnowflakeConnectorProfileCredentialsValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Password => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Username => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SlackConnectorProfileProperties',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SlackConnectorProfileProperties',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SlackConnectorProfilePropertiesValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SlackConnectorProfilePropertiesValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has InstanceUrl => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SlackConnectorProfileCredentials',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SlackConnectorProfileCredentials',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SlackConnectorProfileCredentialsValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SlackConnectorProfileCredentialsValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has AccessToken => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ClientId => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ClientSecret => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ConnectorOAuthRequest => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ConnectorOAuthRequest', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SingularConnectorProfileCredentials',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SingularConnectorProfileCredentials',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SingularConnectorProfileCredentialsValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SingularConnectorProfileCredentialsValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has ApiKey => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ServiceNowConnectorProfileProperties',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ServiceNowConnectorProfileProperties',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ServiceNowConnectorProfilePropertiesValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ServiceNowConnectorProfilePropertiesValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has InstanceUrl => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ServiceNowConnectorProfileCredentials',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ServiceNowConnectorProfileCredentials',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ServiceNowConnectorProfileCredentialsValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ServiceNowConnectorProfileCredentialsValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Password => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Username => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SalesforceConnectorProfileProperties',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SalesforceConnectorProfileProperties',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SalesforceConnectorProfilePropertiesValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SalesforceConnectorProfilePropertiesValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has InstanceUrl => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has isSandboxEnvironment => (isa => 'Cfn::Value::Boolean', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SalesforceConnectorProfileCredentials',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SalesforceConnectorProfileCredentials',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SalesforceConnectorProfileCredentialsValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SalesforceConnectorProfileCredentialsValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has AccessToken => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ConnectorOAuthRequest => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ConnectorOAuthRequest', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has RefreshToken => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::RedshiftConnectorProfileProperties',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::RedshiftConnectorProfileProperties',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::RedshiftConnectorProfilePropertiesValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::RedshiftConnectorProfilePropertiesValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has BucketName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has BucketPrefix => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has DatabaseUrl => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has RoleArn => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::RedshiftConnectorProfileCredentials',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::RedshiftConnectorProfileCredentials',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::RedshiftConnectorProfileCredentialsValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::RedshiftConnectorProfileCredentialsValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Password => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Username => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::MarketoConnectorProfileProperties',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::MarketoConnectorProfileProperties',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::MarketoConnectorProfilePropertiesValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::MarketoConnectorProfilePropertiesValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has InstanceUrl => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::MarketoConnectorProfileCredentials',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::MarketoConnectorProfileCredentials',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::MarketoConnectorProfileCredentialsValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::MarketoConnectorProfileCredentialsValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has AccessToken => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ClientId => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ClientSecret => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ConnectorOAuthRequest => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ConnectorOAuthRequest', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::InforNexusConnectorProfileProperties',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::InforNexusConnectorProfileProperties',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::InforNexusConnectorProfilePropertiesValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::InforNexusConnectorProfilePropertiesValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has InstanceUrl => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::InforNexusConnectorProfileCredentials',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::InforNexusConnectorProfileCredentials',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::InforNexusConnectorProfileCredentialsValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::InforNexusConnectorProfileCredentialsValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has AccessKeyId => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Datakey => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has SecretAccessKey => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has UserId => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::GoogleAnalyticsConnectorProfileCredentials',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::GoogleAnalyticsConnectorProfileCredentials',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::GoogleAnalyticsConnectorProfileCredentialsValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::GoogleAnalyticsConnectorProfileCredentialsValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has AccessToken => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ClientId => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ClientSecret => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ConnectorOAuthRequest => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ConnectorOAuthRequest', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has RefreshToken => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::DynatraceConnectorProfileProperties',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::DynatraceConnectorProfileProperties',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::DynatraceConnectorProfilePropertiesValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::DynatraceConnectorProfilePropertiesValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has InstanceUrl => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::DynatraceConnectorProfileCredentials',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::DynatraceConnectorProfileCredentials',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::DynatraceConnectorProfileCredentialsValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::DynatraceConnectorProfileCredentialsValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has ApiToken => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::DatadogConnectorProfileProperties',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::DatadogConnectorProfileProperties',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::DatadogConnectorProfilePropertiesValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::DatadogConnectorProfilePropertiesValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has InstanceUrl => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::DatadogConnectorProfileCredentials',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::DatadogConnectorProfileCredentials',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::DatadogConnectorProfileCredentialsValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::DatadogConnectorProfileCredentialsValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has ApiKey => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ApplicationKey => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::AmplitudeConnectorProfileCredentials',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::AmplitudeConnectorProfileCredentials',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::AmplitudeConnectorProfileCredentialsValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::AmplitudeConnectorProfileCredentialsValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has ApiKey => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has SecretKey => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ConnectorProfileProperties',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ConnectorProfileProperties',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ConnectorProfilePropertiesValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ConnectorProfilePropertiesValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Datadog => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::DatadogConnectorProfileProperties', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Dynatrace => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::DynatraceConnectorProfileProperties', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has InforNexus => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::InforNexusConnectorProfileProperties', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Marketo => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::MarketoConnectorProfileProperties', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Redshift => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::RedshiftConnectorProfileProperties', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Salesforce => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SalesforceConnectorProfileProperties', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ServiceNow => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ServiceNowConnectorProfileProperties', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Slack => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SlackConnectorProfileProperties', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Snowflake => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SnowflakeConnectorProfileProperties', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Veeva => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::VeevaConnectorProfileProperties', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Zendesk => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ZendeskConnectorProfileProperties', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ConnectorProfileCredentials',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ConnectorProfileCredentials',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ConnectorProfileCredentialsValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ConnectorProfileCredentialsValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Amplitude => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::AmplitudeConnectorProfileCredentials', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Datadog => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::DatadogConnectorProfileCredentials', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Dynatrace => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::DynatraceConnectorProfileCredentials', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has GoogleAnalytics => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::GoogleAnalyticsConnectorProfileCredentials', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has InforNexus => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::InforNexusConnectorProfileCredentials', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Marketo => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::MarketoConnectorProfileCredentials', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Redshift => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::RedshiftConnectorProfileCredentials', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Salesforce => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SalesforceConnectorProfileCredentials', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ServiceNow => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ServiceNowConnectorProfileCredentials', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Singular => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SingularConnectorProfileCredentials', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Slack => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SlackConnectorProfileCredentials', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Snowflake => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SnowflakeConnectorProfileCredentials', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Trendmicro => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::TrendmicroConnectorProfileCredentials', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Veeva => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::VeevaConnectorProfileCredentials', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Zendesk => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ZendeskConnectorProfileCredentials', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ConnectorProfileConfig',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ConnectorProfileConfig',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ConnectorProfileConfigValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ConnectorProfileConfigValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has ConnectorProfileCredentials => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ConnectorProfileCredentials', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ConnectorProfileProperties => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ConnectorProfileProperties', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Resource::Properties';
  
  has ConnectionMode => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ConnectorProfileConfig => (isa => 'Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ConnectorProfileConfig', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ConnectorProfileName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
  has ConnectorType => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
  has KMSArn => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
}

1;
### main pod documentation begin ###

=encoding UTF-8

=head1 NAME

Cfn::Resource::AWS::AppFlow::ConnectorProfile - Cfn resource for AWS::AppFlow::ConnectorProfile

=head1 DESCRIPTION

This module implements a Perl module that represents the CloudFormation object AWS::AppFlow::ConnectorProfile.

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
