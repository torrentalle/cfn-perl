requires 'Moose';
requires 'MooseX::StrictConstructor';
requires 'MooseX::SlurpyConstructor';
requires 'JSON';
requires 'YAML::PP', '>= 0.013';
requires 'Module::Runtime';

on test => sub {
  requires 'Data::Printer';
  requires 'File::Slurp';
  requires 'Test::More';
  requires 'Test::Exception';
  requires 'FindBin';
  requires 'IO::Dir';
  requires 'File::Slurp';
  requires 'Test::Pod';
};

on develop => sub {
  requires 'MooseX::Types::Path::Class';
  requires 'MooseX::DataModel';
  requires 'JSON::MaybeXS';
  requires 'Sort::Topological';
  requires 'Template';
};
