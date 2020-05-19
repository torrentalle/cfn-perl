# AWS::Macie::FindingsFilter generated from spec 14.3.0
use Moose::Util::TypeConstraints;

coerce 'Cfn::Resource::Properties::AWS::Macie::FindingsFilter',
  from 'HashRef',
   via { Cfn::Resource::Properties::AWS::Macie::FindingsFilter->new( %$_ ) };

package Cfn::Resource::AWS::Macie::FindingsFilter {
  use Moose;
  extends 'Cfn::Resource';
  has Properties => (isa => 'Cfn::Resource::Properties::AWS::Macie::FindingsFilter', is => 'rw', coerce => 1);
  
  sub AttributeList {
    [ 'Arn','FindingsFilterListItems','Id' ]
  }
  sub supported_regions {
    [ 'ap-east-1','ap-northeast-1','ap-south-1','ap-southeast-1','ap-southeast-2','ca-central-1','eu-central-1','eu-north-1','eu-west-1','eu-west-2','eu-west-3','sa-east-1','us-east-1','us-east-2','us-west-1','us-west-2' ]
  }
}



subtype 'Cfn::Resource::Properties::AWS::Macie::FindingsFilter::Criterion',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::Macie::FindingsFilter::Criterion',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::Macie::FindingsFilter::CriterionValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::Macie::FindingsFilter::CriterionValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
}

subtype 'Cfn::Resource::Properties::AWS::Macie::FindingsFilter::FindingCriteria',
     as 'Cfn::Value';

coerce 'Cfn::Resource::Properties::AWS::Macie::FindingsFilter::FindingCriteria',
  from 'HashRef',
   via {
     if (my $f = Cfn::TypeLibrary::try_function($_)) {
       return $f
     } else {
       return Cfn::Resource::Properties::AWS::Macie::FindingsFilter::FindingCriteriaValue->new( %$_ );
     }
   };

package Cfn::Resource::Properties::AWS::Macie::FindingsFilter::FindingCriteriaValue {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Value::TypedValue';
  
  has Criterion => (isa => 'Cfn::Resource::Properties::AWS::Macie::FindingsFilter::Criterion', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

package Cfn::Resource::Properties::AWS::Macie::FindingsFilter {
  use Moose;
  use MooseX::StrictConstructor;
  extends 'Cfn::Resource::Properties';
  
  has Action => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Description => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has FindingCriteria => (isa => 'Cfn::Resource::Properties::AWS::Macie::FindingsFilter::FindingCriteria', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Name => (isa => 'Cfn::Value::String', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
  has Position => (isa => 'Cfn::Value::Integer', is => 'rw', coerce => 1, traits => [ 'CfnMutability' ], mutability => 'Mutable');
}

1;
