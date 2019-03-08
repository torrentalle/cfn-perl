#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;
use JSON::MaybeXS;
use Data::Dumper;
use YAML::PP;
use Cfn;
use Moose::Util::TypeConstraints qw/find_type_constraint/;

#https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference.html

my $cfn_value_tc = find_type_constraint('Cfn::Value');
my $cfn = Cfn->new;
my $yaml_parser = YAML::PP->new;

sub yaml {
  my ($yaml, $hashref, $json) = @_;

  note "--- YAML ---";
  note $yaml;
  note "--- HashRef ---";
  note Dumper($hashref);
  note "--- JSON ---";
  note $json;

  my $parsed_json = decode_json($json);

  my $object = $cfn_value_tc->coerce($parsed_json);
  isa_ok($object, 'Cfn::Value::Function', 'json coerced to Cfn::Value is a Cfn::Value::Function subclass');
  is_deeply($object->as_hashref, $hashref, 'the Cfn::Value::Function object is equivalent to hashref');

  #TODO: parse $yaml to a Cfn::Value
  #      isa_ok Cfn::Value::Function
  #      pass the Cfn::Value to YAML. See if it's as_hashref is equiv to hash_ref
 
  my $expected_yaml_struct = $yaml_parser->load_string($yaml);
  my $got_yaml_struct = $yaml_parser->load_string($cfn->yaml->dump_string($object));
  is_deeply($got_yaml_struct, $expected_yaml_struct, 'got equivalent YAMLS');
}

sub short_yaml {};

# Fn::Base64
yaml("Fn::Base64: AWS CloudFormation\n", { 'Fn::Base64' => 'AWS CloudFormation' }, '{ "Fn::Base64" : "AWS CloudFormation" }');

yaml(<<EOY, { "Fn::Cidr" => [ 'ipBlock', 'count', 'cidrBits' ] }, '{ "Fn::Cidr" : [ "ipBlock", "count", "cidrBits" ] }');
Fn::Cidr: 
  - ipBlock 
  - count
  - cidrBits
EOY

yaml(<<EOY, { "Fn::GetAtt" => [ 'logicalNameOfResource', 'attributeName' ] }, '{ "Fn::GetAtt" : [ "logicalNameOfResource", "attributeName" ] }');
Fn::GetAtt: [ logicalNameOfResource, attributeName ]
EOY

yaml('Ref: logicalName', { Ref => 'logicalName' }, '{ "Ref" : "logicalName" }');

yaml('Fn::FindInMap: [ MapName, TopLevelKey, SecondLevelKey ]', { "Fn::FindInMap" => [ "MapName", "TopLevelKey", "SecondLevelKey"] }, '{ "Fn::FindInMap" : [ "MapName", "TopLevelKey", "SecondLevelKey"] }');

yaml('Fn::GetAZs: region', { "Fn::GetAZs" => "region" }, '{ "Fn::GetAZs" : "region" }');

yaml('Fn::ImportValue: sharedValueToImport', { "Fn::ImportValue" => 'sharedValueToImport' }, '{ "Fn::ImportValue" : "sharedValueToImport" }');

{
  my $json = <<EOJ;
{
  "Fn::Join": [
    "", [
      "arn:",
      {
        "Ref": "Partition"
      },
      ":s3:::elasticbeanstalk-*-",
      {
        "Ref": "AWS::AccountId"
      }
    ]
  ]
}
EOJ

my $yaml = <<EOY;
Fn::Join:
  - ''
  - - 'arn:'
    - Ref: Partition
    - ':s3:::elasticbeanstalk-*-'
    - Ref: 'AWS::AccountId'
EOY

  yaml($yaml, { "Fn::Join" => [ "", [ "arn:", { Ref => "Partition" }, ":s3:::elasticbeanstalk-*-", { Ref => "AWS::AccountId" } ] ] }, $json);
}

#TODO: test these:
#https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-select.html
#https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-split.html
#https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-sub.html
#https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-transform.html
#https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-conditions.html

done_testing;

__DATA__
short_yaml('!Base64 valueToEncode', { 'Fn::Base64' => 'valueToEncode' }, '{ "Fn::Base64": "valueToEncode" }');
short_yaml('!Cidr [ ipBlock, count, cidrBits ]', { "Fn::Cidr": [ 'ipBlock', 'count', 'cidrBits' ] });
short_yaml('!Cidr [ "192.168.0.0/24", 6, 5 ]', { "Fn::Cidr": [ '192.168.0.0/24', 6, 5 ] });
short_yaml('!GetAtt logicalNameOfResource.attributeName', {}, '{}');
short_yaml('!Ref logicalName');
# !Select [ 0, !Cidr [ !Select [ 0, !GetAtt ExampleVpc.Ipv6CidrBlocks], 1, 64 ]]
# !FindInMap [ MapName, TopLevelKey, SecondLevelKey ]

!FindInMap
 - RegionMap
 - !Ref 'AWS::Region'
 - HVM64

!GetAZs region

!ImportValue sharedValueToImport

!Join [ ":", [ a, b, c ] ]

!Join
  - ''
  - - 'arn:'
    - !Ref Partition
    - ':s3:::elasticbeanstalk-*-'
    - !Ref 'AWS::AccountId'


short_yaml('!If [CreateLargeSize, 100, 10]');

short_yaml(<<EOY, '');
MyAndCondition: !And
  - !Equals ["sg-mysggroup", !Ref "ASecurityGroup"]
  - !Condition SomeOtherCondition
EOY

short_yaml(<<EOY, '');
UseProdCondition:
  !Equals [!Ref EnvironmentType, prod]
EOY

short_yaml(<<EOY, '',);
SecurityGroups:
  - !If [CreateNewSecurityGroup, !Ref NewSecurityGroup, !Ref ExistingSecurityGroup]
EOY

# Don't work!
"!Base64 !Sub string"
"!Base64 !Ref logical_ID"
