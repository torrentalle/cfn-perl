#!/usr/bin/env perl

use Test::More;
use Cfn;
use Cfn::Resource::AWS::ApiGateway::Account;
use Cfn::Resource::AWS::ApiGateway::RestApi;
use Cfn::Resource::AWS::CloudFormation::CustomResource;

{
  my $res = Cfn::Resource::AWS::ApiGateway::RestApi->new(
    Properties => {}
  );
  is_deeply($res->AttributeList, [ 'RootResourceId' ], 'AttributeList OK');
  ok($res->hasAttribute('RootResourceId'), 'hasAttribute returns correctly for existing');
  ok(not($res->hasAttribute('UnExistingAttribute')), 'hasAttribute returns correctly for non-existing');
  ok(scalar(@{ $res->supported_regions }) > 0, 'supported_regions can be called as a method');
}

{
  my $res = Cfn::Resource::AWS::ApiGateway::Account->new(
    Properties => {}
  );
  is_deeply($res->AttributeList, [ ], 'AttributeList OK');
  ok(not($res->hasAttribute('UnExistingAttribute')), 'hasAttribute returns correctly for non-existing');
}

{
  my $res = Cfn::Resource::AWS::CloudFormation::CustomResource->new(
    Properties => { ServiceToken => '...' }
  );
  is_deeply($res->AttributeList, undef, 'AttributeList OK');
  ok($res->hasAttribute('AnAttribute'), 'hasAttribute returns correctly for any attribute');
}

done_testing;
