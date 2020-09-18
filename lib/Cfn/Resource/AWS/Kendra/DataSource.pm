# AWS::Kendra::DataSource generated from spec 18.4.0
use Moose::Util::TypeConstraints;

coerce 'Cfn::Resource::Properties::AWS::Kendra::DataSource',
  from 'HashRef',
   via { Cfn::Resource::Properties::AWS::Kendra::DataSource->new( %$_ ) };

package Cfn::Resource::AWS::Kendra::DataSource {
  use Moose;
  extends 'Cfn::Resource';
  has Properties => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource', is => 'rw', coerce => 1);
  
  sub AttributeList {
    [ 'Arn','Id' ]
  }
  sub supported_regions {
    [ 'eu-west-1','us-east-1','us-west-2' ]
  }
}


subtype 'ArrayOfCfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceToIndexFieldMapping',
     as 'Cfn::Value',
  where { $_->isa('Cfn::Value::Array') or $_->isa('Cfn::Value::Function') },
message { "$_ is not a Cfn::Value or a Cfn::Value::Function" };

coerce 'ArrayOfCfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceToIndexFieldMapping',
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
         Moose::Util::TypeConstraints::find_type_constraint('Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceToIndexFieldMapping')->coerce($_)
       } @$_
     ]);
   };

subtype 'Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceToIndexFieldMapping',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceToIndexFieldMapping',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceToIndexFieldMappingValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceToIndexFieldMappingValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has DataSourceFieldName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has DateFieldFormat => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has IndexFieldName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceToIndexFieldMappingList',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceToIndexFieldMappingList',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceToIndexFieldMappingListValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceToIndexFieldMappingListValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has DataSourceToIndexFieldMappingList => (isa => 'ArrayOfCfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceToIndexFieldMapping', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}
subtype 'ArrayOfCfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceCustomKnowledgeArticleTypeConfiguration',
     as 'Cfn::Value',
  where { $_->isa('Cfn::Value::Array') or $_->isa('Cfn::Value::Function') },
message { "$_ is not a Cfn::Value or a Cfn::Value::Function" };

coerce 'ArrayOfCfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceCustomKnowledgeArticleTypeConfiguration',
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
         Moose::Util::TypeConstraints::find_type_constraint('Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceCustomKnowledgeArticleTypeConfiguration')->coerce($_)
       } @$_
     ]);
   };

subtype 'Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceCustomKnowledgeArticleTypeConfiguration',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceCustomKnowledgeArticleTypeConfiguration',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceCustomKnowledgeArticleTypeConfigurationValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceCustomKnowledgeArticleTypeConfigurationValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has DocumentDataFieldName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has DocumentTitleFieldName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has FieldMappings => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceToIndexFieldMappingList', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Name => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}
subtype 'ArrayOfCfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceStandardObjectConfiguration',
     as 'Cfn::Value',
  where { $_->isa('Cfn::Value::Array') or $_->isa('Cfn::Value::Function') },
message { "$_ is not a Cfn::Value or a Cfn::Value::Function" };

coerce 'ArrayOfCfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceStandardObjectConfiguration',
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
         Moose::Util::TypeConstraints::find_type_constraint('Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceStandardObjectConfiguration')->coerce($_)
       } @$_
     ]);
   };

subtype 'Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceStandardObjectConfiguration',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceStandardObjectConfiguration',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceStandardObjectConfigurationValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceStandardObjectConfigurationValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has DocumentDataFieldName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has DocumentTitleFieldName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has FieldMappings => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceToIndexFieldMappingList', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Name => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceStandardKnowledgeArticleTypeConfiguration',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceStandardKnowledgeArticleTypeConfiguration',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceStandardKnowledgeArticleTypeConfigurationValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceStandardKnowledgeArticleTypeConfigurationValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has DocumentDataFieldName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has DocumentTitleFieldName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has FieldMappings => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceToIndexFieldMappingList', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceKnowledgeArticleStateList',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceKnowledgeArticleStateList',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceKnowledgeArticleStateListValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceKnowledgeArticleStateListValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has SalesforceKnowledgeArticleStateList => (isa => 'Cfn::Value::Array|Cfn::Value::Function|Cfn::DynamicValue', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceCustomKnowledgeArticleTypeConfigurationList',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceCustomKnowledgeArticleTypeConfigurationList',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceCustomKnowledgeArticleTypeConfigurationListValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceCustomKnowledgeArticleTypeConfigurationListValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has SalesforceCustomKnowledgeArticleTypeConfigurationList => (isa => 'ArrayOfCfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceCustomKnowledgeArticleTypeConfiguration', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceChatterFeedIncludeFilterTypes',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceChatterFeedIncludeFilterTypes',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceChatterFeedIncludeFilterTypesValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceChatterFeedIncludeFilterTypesValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has SalesforceChatterFeedIncludeFilterTypes => (isa => 'Cfn::Value::Array|Cfn::Value::Function|Cfn::DynamicValue', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::Kendra::DataSource::S3Path',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::Kendra::DataSource::S3Path',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::Kendra::DataSource::S3PathValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::Kendra::DataSource::S3PathValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Bucket => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Key => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::Kendra::DataSource::OneDriveUserList',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::Kendra::DataSource::OneDriveUserList',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::Kendra::DataSource::OneDriveUserListValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::Kendra::DataSource::OneDriveUserListValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has OneDriveUserList => (isa => 'Cfn::Value::Array|Cfn::Value::Function|Cfn::DynamicValue', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceInclusionsExclusionsStrings',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceInclusionsExclusionsStrings',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceInclusionsExclusionsStringsValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceInclusionsExclusionsStringsValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has DataSourceInclusionsExclusionsStrings => (isa => 'Cfn::Value::Array|Cfn::Value::Function|Cfn::DynamicValue', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::Kendra::DataSource::ChangeDetectingColumns',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::Kendra::DataSource::ChangeDetectingColumns',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::Kendra::DataSource::ChangeDetectingColumnsValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::Kendra::DataSource::ChangeDetectingColumnsValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has ChangeDetectingColumns => (isa => 'Cfn::Value::Array|Cfn::Value::Function|Cfn::DynamicValue', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::Kendra::DataSource::SqlConfiguration',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::Kendra::DataSource::SqlConfiguration',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::Kendra::DataSource::SqlConfigurationValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::Kendra::DataSource::SqlConfigurationValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has QueryIdentifiersEnclosingOption => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::Kendra::DataSource::ServiceNowServiceCatalogConfiguration',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::Kendra::DataSource::ServiceNowServiceCatalogConfiguration',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::Kendra::DataSource::ServiceNowServiceCatalogConfigurationValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::Kendra::DataSource::ServiceNowServiceCatalogConfigurationValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has CrawlAttachments => (isa => 'Cfn::Value::Boolean', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has DocumentDataFieldName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has DocumentTitleFieldName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ExcludeAttachmentFilePatterns => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceInclusionsExclusionsStrings', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has FieldMappings => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceToIndexFieldMappingList', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has IncludeAttachmentFilePatterns => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceInclusionsExclusionsStrings', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::Kendra::DataSource::ServiceNowKnowledgeArticleConfiguration',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::Kendra::DataSource::ServiceNowKnowledgeArticleConfiguration',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::Kendra::DataSource::ServiceNowKnowledgeArticleConfigurationValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::Kendra::DataSource::ServiceNowKnowledgeArticleConfigurationValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has CrawlAttachments => (isa => 'Cfn::Value::Boolean', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has DocumentDataFieldName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has DocumentTitleFieldName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ExcludeAttachmentFilePatterns => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceInclusionsExclusionsStrings', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has FieldMappings => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceToIndexFieldMappingList', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has IncludeAttachmentFilePatterns => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceInclusionsExclusionsStrings', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceStandardObjectConfigurationList',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceStandardObjectConfigurationList',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceStandardObjectConfigurationListValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceStandardObjectConfigurationListValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has SalesforceStandardObjectConfigurationList => (isa => 'ArrayOfCfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceStandardObjectConfiguration', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceStandardObjectAttachmentConfiguration',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceStandardObjectAttachmentConfiguration',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceStandardObjectAttachmentConfigurationValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceStandardObjectAttachmentConfigurationValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has DocumentTitleFieldName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has FieldMappings => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceToIndexFieldMappingList', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceKnowledgeArticleConfiguration',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceKnowledgeArticleConfiguration',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceKnowledgeArticleConfigurationValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceKnowledgeArticleConfigurationValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has CustomKnowledgeArticleTypeConfigurations => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceCustomKnowledgeArticleTypeConfigurationList', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has IncludedStates => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceKnowledgeArticleStateList', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has StandardKnowledgeArticleTypeConfiguration => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceStandardKnowledgeArticleTypeConfiguration', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceChatterFeedConfiguration',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceChatterFeedConfiguration',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceChatterFeedConfigurationValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceChatterFeedConfigurationValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has DocumentDataFieldName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has DocumentTitleFieldName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has FieldMappings => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceToIndexFieldMappingList', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has IncludeFilterTypes => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceChatterFeedIncludeFilterTypes', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::Kendra::DataSource::OneDriveUsers',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::Kendra::DataSource::OneDriveUsers',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::Kendra::DataSource::OneDriveUsersValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::Kendra::DataSource::OneDriveUsersValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has OneDriveUserList => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::OneDriveUserList', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has OneDriveUserS3Path => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::S3Path', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::Kendra::DataSource::DocumentsMetadataConfiguration',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::Kendra::DataSource::DocumentsMetadataConfiguration',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::Kendra::DataSource::DocumentsMetadataConfigurationValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::Kendra::DataSource::DocumentsMetadataConfigurationValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has S3Prefix => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceVpcConfiguration',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceVpcConfiguration',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceVpcConfigurationValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceVpcConfigurationValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has SecurityGroupIds => (isa => 'Cfn::Value::Array|Cfn::Value::Function|Cfn::DynamicValue', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has SubnetIds => (isa => 'Cfn::Value::Array|Cfn::Value::Function|Cfn::DynamicValue', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::Kendra::DataSource::ConnectionConfiguration',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::Kendra::DataSource::ConnectionConfiguration',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::Kendra::DataSource::ConnectionConfigurationValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::Kendra::DataSource::ConnectionConfigurationValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has DatabaseHost => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has DatabaseName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has DatabasePort => (isa => 'Cfn::Value::Integer', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has SecretArn => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has TableName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::Kendra::DataSource::ColumnConfiguration',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::Kendra::DataSource::ColumnConfiguration',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::Kendra::DataSource::ColumnConfigurationValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::Kendra::DataSource::ColumnConfigurationValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has ChangeDetectingColumns => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::ChangeDetectingColumns', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has DocumentDataColumnName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has DocumentIdColumnName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has DocumentTitleColumnName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has FieldMappings => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceToIndexFieldMappingList', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::Kendra::DataSource::AclConfiguration',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::Kendra::DataSource::AclConfiguration',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::Kendra::DataSource::AclConfigurationValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::Kendra::DataSource::AclConfigurationValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has AllowedGroupsColumnName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::Kendra::DataSource::AccessControlListConfiguration',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::Kendra::DataSource::AccessControlListConfiguration',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::Kendra::DataSource::AccessControlListConfigurationValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::Kendra::DataSource::AccessControlListConfigurationValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has KeyPath => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::Kendra::DataSource::SharePointConfiguration',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::Kendra::DataSource::SharePointConfiguration',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::Kendra::DataSource::SharePointConfigurationValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::Kendra::DataSource::SharePointConfigurationValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has CrawlAttachments => (isa => 'Cfn::Value::Boolean', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has DocumentTitleFieldName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ExclusionPatterns => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceInclusionsExclusionsStrings', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has FieldMappings => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceToIndexFieldMappingList', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has InclusionPatterns => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceInclusionsExclusionsStrings', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has SecretArn => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has SharePointVersion => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Urls => (isa => 'Cfn::Value::Array|Cfn::Value::Function|Cfn::DynamicValue', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has UseChangeLog => (isa => 'Cfn::Value::Boolean', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has VpcConfiguration => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceVpcConfiguration', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::Kendra::DataSource::ServiceNowConfiguration',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::Kendra::DataSource::ServiceNowConfiguration',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::Kendra::DataSource::ServiceNowConfigurationValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::Kendra::DataSource::ServiceNowConfigurationValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has HostUrl => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has KnowledgeArticleConfiguration => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::ServiceNowKnowledgeArticleConfiguration', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has SecretArn => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ServiceCatalogConfiguration => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::ServiceNowServiceCatalogConfiguration', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ServiceNowBuildVersion => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceConfiguration',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceConfiguration',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceConfigurationValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceConfigurationValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has ChatterFeedConfiguration => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceChatterFeedConfiguration', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has CrawlAttachments => (isa => 'Cfn::Value::Boolean', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ExcludeAttachmentFilePatterns => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceInclusionsExclusionsStrings', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has IncludeAttachmentFilePatterns => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceInclusionsExclusionsStrings', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has KnowledgeArticleConfiguration => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceKnowledgeArticleConfiguration', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has SecretArn => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ServerUrl => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has StandardObjectAttachmentConfiguration => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceStandardObjectAttachmentConfiguration', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has StandardObjectConfigurations => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceStandardObjectConfigurationList', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::Kendra::DataSource::S3DataSourceConfiguration',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::Kendra::DataSource::S3DataSourceConfiguration',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::Kendra::DataSource::S3DataSourceConfigurationValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::Kendra::DataSource::S3DataSourceConfigurationValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has AccessControlListConfiguration => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::AccessControlListConfiguration', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has BucketName => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has DocumentsMetadataConfiguration => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::DocumentsMetadataConfiguration', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ExclusionPatterns => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceInclusionsExclusionsStrings', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has InclusionPrefixes => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceInclusionsExclusionsStrings', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::Kendra::DataSource::OneDriveConfiguration',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::Kendra::DataSource::OneDriveConfiguration',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::Kendra::DataSource::OneDriveConfigurationValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::Kendra::DataSource::OneDriveConfigurationValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has ExclusionPatterns => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceInclusionsExclusionsStrings', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has FieldMappings => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceToIndexFieldMappingList', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has InclusionPatterns => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceInclusionsExclusionsStrings', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has OneDriveUsers => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::OneDriveUsers', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has SecretArn => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has TenantDomain => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::Kendra::DataSource::DatabaseConfiguration',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::Kendra::DataSource::DatabaseConfiguration',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::Kendra::DataSource::DatabaseConfigurationValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::Kendra::DataSource::DatabaseConfigurationValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has AclConfiguration => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::AclConfiguration', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ColumnConfiguration => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::ColumnConfiguration', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ConnectionConfiguration => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::ConnectionConfiguration', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has DatabaseEngineType => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has SqlConfiguration => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::SqlConfiguration', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has VpcConfiguration => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceVpcConfiguration', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::Kendra::DataSource::TagList',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::Kendra::DataSource::TagList',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::Kendra::DataSource::TagListValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::Kendra::DataSource::TagListValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has TagList => (isa => 'ArrayOfCfn::Resource::Properties::TagType', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

subtype 'Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceConfiguration',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceConfiguration',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceConfigurationValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceConfigurationValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has DatabaseConfiguration => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::DatabaseConfiguration', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has OneDriveConfiguration => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::OneDriveConfiguration', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has S3Configuration => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::S3DataSourceConfiguration', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has SalesforceConfiguration => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::SalesforceConfiguration', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has ServiceNowConfiguration => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::ServiceNowConfiguration', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has SharePointConfiguration => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::SharePointConfiguration', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

package Cfn::Resource::Properties::AWS::Kendra::DataSource {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Resource::Properties';
  
  has DataSourceConfiguration => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::DataSourceConfiguration', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Description => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has IndexId => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Name => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has RoleArn => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Schedule => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Tags => (isa => 'Cfn::Resource::Properties::AWS::Kendra::DataSource::TagList', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Type => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, required => 1, traits => [ 'CfnMutability' ], mutability => 'Immutable');
}

1;
### main pod documentation begin ###

=encoding UTF-8

=head1 NAME

Cfn::Resource::AWS::Kendra::DataSource - Cfn resource for AWS::Kendra::DataSource

=head1 DESCRIPTION

This module implements a Perl module that represents the CloudFormation object AWS::Kendra::DataSource.

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
