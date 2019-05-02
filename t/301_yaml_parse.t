#!/usr/bin/env perl

use strict;
use warnings;

use YAML::PP;
use FindBin;
use File::Slurp;
use Test::More;
use Cfn;

my $t_dir = "$FindBin::Bin/cfn_yaml/";
use IO::Dir;
my $d = IO::Dir->new($t_dir);

while (my $file = $d->read){
  next if ($file =~ m/^\./);
  next if (not $file =~ m/\.yaml$/);
  my $content = read_file("$t_dir/$file");
  my $cfn;
  note "for file $t_dir/$file";
  eval { $cfn = Cfn->from_yaml($content) };
  if ($@){
    if ($@ =~ m/you may need to install the .* module/){
      TODO:{
        local $TODO = 'The module for something in this file is not developed yet';
        fail("File $t_dir/$file didn't parse");
      };
    } else {
      diag($@);
      fail("File $t_dir/$file didn't parse");
    }
  } else {
    pass("File $t_dir/$file parsed without problems");
    my $hash = YAML::PP->new->load_string($content);
    test_ds_vs_parsed($hash, $cfn, $file);
  }
}
$d->close;

done_testing;

sub test_ds_vs_parsed {
  my ($datastruct, $parsed, $test_name) = @_;

  cmp_ok($parsed->ResourceCount,  '==', scalar(keys %{ $datastruct->{ Resources  } }), "Got the same number of resources for $test_name");
  cmp_ok($parsed->ParameterCount, '==', scalar(keys %{ $datastruct->{ Parameters } }), "Got the same number of parameter for $test_name");
  cmp_ok($parsed->OutputCount,    '==', scalar(keys %{ $datastruct->{ Outputs    } }), "Got the same number of ouputs for $test_name");
  cmp_ok($parsed->MappingCount,   '==', scalar(keys %{ $datastruct->{ Mappings   } }), "Got the same number of mappings for $test_name");
  cmp_ok($parsed->ConditionCount, '==', scalar(keys %{ $datastruct->{ Conditions } }), "Got the same number of conditions for $test_name");
  cmp_ok($parsed->MetadataCount,  '==', scalar(keys %{ $datastruct->{ Metadata   } }), "Got the same number of metadata entries for $test_name");
}
