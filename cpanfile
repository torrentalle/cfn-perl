requires 'Moose';
requires 'MooseX::StrictConstructor';
requires 'JSON';

on test => sub {
  requires 'Data::Printer';
  requires 'File::Slurp';
};
