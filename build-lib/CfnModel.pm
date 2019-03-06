package CfnModel;
  use Moose;
  use feature 'postderef';
  no warnings 'experimental::postderef';

  use AWSJsonSpec;
  use MooseX::Types::Path::Class;
  use CfnModel::CfnResource;
  use CfnModel::CfnSubtype;
  use CfnModel::CfnProperty;

  has dir => (is => 'ro', isa => 'Path::Class::Dir', required => 1, coerce => 1);

  has file => (is => 'ro', isa => 'Path::Class::File', coerce => 1, lazy => 1, default => sub {
    my $self = shift;
    Path::Class::File->new($self->dir, 'spec.json');
  });

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

  has region_files => (is => 'ro', isa => 'ArrayRef[Path::Class::File]', lazy => 1, default => sub {
    my $self = shift;
    my @files = $self->dir->children;
    @files = grep { $_->basename =~ m/[a-z]{2}\-\w+\-\d+\.json/ } @files;
    @files = sort { $a->basename cmp $b->basename } @files;
    return \@files;
  });

   has region_specs => (is => 'ro', lazy => 1, isa => 'HashRef[AWSJsonSpec]', default => sub {
    my $self = shift;
    my $regions = { };
    foreach my $region ($self->region_files->@*) {
      my ($region_id) = ($region->basename =~ m/(.*)\.json/);
      $regions->{ $region_id } = AWSJsonSpec->MooseX::DataModel::new_from_json(scalar($region->slurp));
    }
    return $regions;
  });

  has region_resource_map => (is => 'ro', lazy => 1, isa => 'HashRef[ArrayRef[Str]]', lazy => 1, default => sub {
    my $self = shift;
    my $map = {};
    foreach my $region_name (keys $self->region_specs->%*) {
      my $region_spec = $self->region_specs->{ $region_name };
      foreach my $resource_type (keys $region_spec->ResourceTypes->%*) {
        $map->{ $region_name } //= [];
	push @{ $map->{ $resource_type } }, $region_name;
      }
    }
    foreach my $resource_type (keys $map->%*) {
      $map->{ $resource_type } = [ sort @{ $map->{ $resource_type } } ];
    }
    return $map;
  });

1;
