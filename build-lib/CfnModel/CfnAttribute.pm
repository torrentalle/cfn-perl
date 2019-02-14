package CfnModel::CfnAttribute;
  use Moose;
  use feature qw(postderef);

  has name => (is => 'ro', required => 1);
  has spec => (
    is => 'ro',
    required => 1,
    isa => 'AWSJsonSpec::Attribute',
    handles => {
      type => 'PrimitiveType', 
    }
  );
1;
