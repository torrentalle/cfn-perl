#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use Cfn;

my $cfn = Cfn->new;

$cfn->yaml->schema->add_resolver(
  tag => '!Ref',
  implicit => 0,
  match => [ regex => qr{^(.*)$} => sub {
    my $value = shift;
    return { 'Ref' => $value };
  } ]
);

$cfn->yaml->schema->add_resolver(
  tag => '!Sub',
  implicit => 0,
  match => [ regex => qr{^(.*)$} => sub {
    my $value = shift;
    return { 'Fn::Sub' => $value };
  } ]
);

my $ret = Cfn->from_hashref($cfn->yaml->load_file('t/cfn_yaml/sg.yaml'));

use Data::Dumper;
print Dumper($ret);

print $ret->as_json, "\n";

print $ret->as_yaml, "\n";



