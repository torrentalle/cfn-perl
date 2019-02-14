package CfnModel;
  use Moose;
  use feature 'postderef';
  no warnings 'experimental::postderef';

  use AWSJsonSpec;
  use MooseX::Types::Path::Class;
  use CfnModel::CfnResource;
  use CfnModel::CfnSubtype;
  use CfnModel::CfnProperty;

  has file => (is => 'ro', isa => 'Path::Class::File', required => 1, coerce => 1);

  has spec => (is => 'ro', lazy => 1, default => sub {
    my $self = shift;
    AWSJsonSpec->MooseX::DataModel::new_from_json(scalar($self->file->slurp));
  });

  has classes_in_spec => (is => 'ro', isa => 'ArrayRef[Str]', lazy => 1, default => sub {
    my $self = shift;

    return [ keys $self->spec->ResourceTypes->%* ];
  });

  sub class_for {
    my ($self, $class) = @_;
    return CfnModel::CfnResource->new(
      name => $class,
      parent => $self,
      root => $self,
      spec => $self->spec->ResourceTypes->{ $class },
    );
  }

  has classes => (is => 'ro', isa => 'HashRef[CfnModel::CfnResource]', lazy => 1, default => sub {
    my $self = shift;
    my $classes = {};

    foreach my $class ($self->classes_in_spec->@*){
      # CustomResource is hand-written
      next if ($class eq 'AWS::CloudFormation::CustomResource');
      $classes->{ $class } = $self->class_for($class);
    }
    
    return $classes;
  });

  has subtype_names_in_spec => (is => 'ro', isa => 'ArrayRef[Str]', lazy => 1, default => sub {
    my $self = shift;

    return [ keys $self->spec->PropertyTypes->%* ];
  });

  sub subtype_for {
    my ($self, $class) = @_;
    my $spec = $self->spec->PropertyTypes->{ $class };

    die "Didn't find a subtype for $class" if (not defined $spec);

    return CfnModel::CfnSubtype->new(
      name => $class,
      parent => $self,
      root => $self,
      spec => $spec,
    );
  }

  has subtypes => (is => 'ro', isa => 'HashRef[CfnModel::CfnSubtype]', lazy => 1, default => sub {
    my $self = shift;
    my $classes = {};

    foreach my $class ($self->subtype_names_in_spec->@*){
      $classes->{ $class } = $self->subtype_for($class);
    }
    
    return $classes;
  });

  sub write_classes {
    my $self = shift;
    my @classes = @_;
    @classes = keys $self->classes->%* if (@classes == 0);
    $_->write_class for (map { $self->classes->{ $_ } } @classes);
  }

1;
