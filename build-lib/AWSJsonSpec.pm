package AWSJsonSpec::Property {
  use MooseX::DataModel;

  key Required => (isa => 'Bool', required => 1);
  key Documentation => (isa => 'Str', required => 1);
  key PrimitiveType => (isa => 'Str');
  key PrimitiveItemType => (isa => 'Str');
  key Type => (isa => 'Str');
  key ItemType => (isa => 'Str');
  key UpdateType => (isa => 'Str', required => 1);
}
package AWSJsonSpec::Attribute {
  use MooseX::DataModel;
  key PrimitiveType => (isa => 'Str');
  key Type => (isa => 'Str');
}
package AWSJsonSpec::PropertyType {
  use MooseX::DataModel;

  key Required => (isa => 'Bool');
  key Type => (isa => 'Str');
  key UpdateType => (isa => 'Str');
  key ItemType => (isa => 'Str');
  key Documentation => (isa => 'Str');
  object Properties => (isa => 'AWSJsonSpec::Property');
}
package AWSJsonSpec::ResourceType {
  use MooseX::DataModel;

  key Documentation => (isa => 'Str', required => 1);
  object Properties => (isa => 'AWSJsonSpec::Property', required => 1);
  object Attributes => (isa => 'AWSJsonSpec::Attribute');
}
package AWSJsonSpec {
  use MooseX::DataModel;

  key ResourceSpecificationVersion => (isa => 'Str');
  object PropertyTypes => (isa => 'AWSJsonSpec::PropertyType');
  object ResourceTypes => (isa => 'AWSJsonSpec::ResourceType');
}
