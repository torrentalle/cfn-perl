requires 'Moose';
requires 'MooseX::StrictConstructor';
requires 'MooseX::SlurpyConstructor';
requires 'JSON';

on test => sub {
  requires 'Data::Printer';
  requires 'File::Slurp';
};
