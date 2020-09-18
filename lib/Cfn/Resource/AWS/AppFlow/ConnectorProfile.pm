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
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ConnectorOAuthRequest::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ConnectorOAuthRequest::Value {
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
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ZendeskConnectorProfileProperties::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ZendeskConnectorProfileProperties::Value {
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
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ZendeskConnectorProfileCredentials::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ZendeskConnectorProfileCredentials::Value {
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
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::VeevaConnectorProfileProperties::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::VeevaConnectorProfileProperties::Value {
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
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::VeevaConnectorProfileCredentials::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::VeevaConnectorProfileCredentials::Value {
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
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::TrendmicroConnectorProfileCredentials::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::TrendmicroConnectorProfileCredentials::Value {
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
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SnowflakeConnectorProfileProperties::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SnowflakeConnectorProfileProperties::Value {
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
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SnowflakeConnectorProfileCredentials::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SnowflakeConnectorProfileCredentials::Value {
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
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SlackConnectorProfileProperties::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SlackConnectorProfileProperties::Value {
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
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SlackConnectorProfileCredentials::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SlackConnectorProfileCredentials::Value {
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
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SingularConnectorProfileCredentials::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SingularConnectorProfileCredentials::Value {
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
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ServiceNowConnectorProfileProperties::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ServiceNowConnectorProfileProperties::Value {
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
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ServiceNowConnectorProfileCredentials::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ServiceNowConnectorProfileCredentials::Value {
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
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SalesforceConnectorProfileProperties::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SalesforceConnectorProfileProperties::Value {
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
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SalesforceConnectorProfileCredentials::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::SalesforceConnectorProfileCredentials::Value {
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
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::RedshiftConnectorProfileProperties::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::RedshiftConnectorProfileProperties::Value {
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
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::RedshiftConnectorProfileCredentials::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::RedshiftConnectorProfileCredentials::Value {
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
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::MarketoConnectorProfileProperties::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::MarketoConnectorProfileProperties::Value {
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
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::MarketoConnectorProfileCredentials::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::MarketoConnectorProfileCredentials::Value {
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
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::InforNexusConnectorProfileProperties::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::InforNexusConnectorProfileProperties::Value {
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
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::InforNexusConnectorProfileCredentials::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::InforNexusConnectorProfileCredentials::Value {
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
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::GoogleAnalyticsConnectorProfileCredentials::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::GoogleAnalyticsConnectorProfileCredentials::Value {
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
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::DynatraceConnectorProfileProperties::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::DynatraceConnectorProfileProperties::Value {
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
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::DynatraceConnectorProfileCredentials::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::DynatraceConnectorProfileCredentials::Value {
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
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::DatadogConnectorProfileProperties::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::DatadogConnectorProfileProperties::Value {
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
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::DatadogConnectorProfileCredentials::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::DatadogConnectorProfileCredentials::Value {
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
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::AmplitudeConnectorProfileCredentials::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::AmplitudeConnectorProfileCredentials::Value {
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
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ConnectorProfileProperties::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ConnectorProfileProperties::Value {
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
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ConnectorProfileCredentials::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ConnectorProfileCredentials::Value {
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
       return Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ConnectorProfileConfig::Value->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::AppFlow::ConnectorProfile::ConnectorProfileConfig::Value {
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
