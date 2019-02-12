requires 'Moose';
requires 'MooseX::StrictConstructor';
requires 'MooseX::SlurpyConstructor';
requires 'JSON';
requires 'Module::Runtime';

on test => sub {
  requires 'Data::Printer';
  requires 'File::Slurp';
  requires 'Test::More';
  requires 'Test::Exception';
  requires 'FindBin';
  requires 'IO::Dir';
  requires 'File::Slurp';
};
