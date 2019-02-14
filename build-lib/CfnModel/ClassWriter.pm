package CfnModel::ClassWriter;
  use Moose::Role;
  use Path::Class;
  use Template;
  use FindBin;

  has output_dir => (is => 'ro', default => sub { $ENV{ OUTPUT_DIR } or die "Must have ENV OUTPUT_DIR" } );
  requires 'template_file';

  has _tt => (is => 'ro', isa => 'Template', default => sub {
    Template->new(
      INCLUDE_PATH => "$FindBin::Bin/../resource_templates",
      INTERPOLATE => 0,
    );
  });

  sub process_template {
    my ($self, $template_file, $vars) = @_;
    #$self->log->debug('Processing template \'' . $template_file . '\'');
    $vars = {} if (not defined $vars);

    my $output = '';
    $self->_tt->process(
      $self->template_file,
      { c => $self, %$vars },
      \$output
    ) or die "Error processing template " . $self->_tt->error;
    #$self->log->debug('Output from template: ' . $output);

    my ($outfile) = ($output =~ m/package (\S+)(?:\s*;|\s*{)/);
    die "Didn't find package name" if (not defined $outfile or $outfile eq '');

    $outfile =~ s/\:\:/\//g;
    $outfile .= '.pm';

    my $f = file($self->output_dir, $outfile);

    if (-e $f) {
      # Compare contents 
      my $file_content = $f->slurp;
      $file_content =~ s/^#.*generated from spec.*\n//;

      my $output_content = $output;
      $output_content =~ s/^#.*generated from spec.*\n//;

      $f->spew($output) if ($file_content ne $output_content);
    } else {
      $f->parent->mkpath;
      $f->spew($output);
    }
  }

1;
