#!/usr/bin/env perl

use Test::More;
use CCfn;

package Params {
  use Moose;
  with 'MooseX::Getopt';
}

package TestClass {
  use Moose;
  extends 'CCfn';
  use CCfnX::Shortcuts;

  has params => (is => 'ro', isa => 'Params', default => sub { Params->new_with_options });

  resource User1 => 'AWS::IAM::User', {
    UserName => 'myuser',
    Path => '{{resolve:ssm-secure:IAMUserPassword:10}}',
    LoginProfile => {
      Password => '{{resolve:ssm-secure:IAMUserPassword:10}}',
    }
  };

  resource User1_1 => 'AWS::IAM::User', {
    UserName => 'myuser',
    Path => '{{resolve:ssm:IAMUserPassword:10}}',
    LoginProfile => {
      Password => '{{resolve:ssm:IAMUserPassword:10}}',
    }
  };


  resource User2 => 'AWS::IAM::User', {
    UserName => 'myuser',
    Path => '{{resolve:secretsmanager:MyRDSSecret:SecretString:username}}',
    LoginProfile => {
      Password => '{{resolve:secretsmanager:MyRDSSecret:SecretString:username}}',
    }
  };
  
  resource User3 => 'AWS::IAM::User', {
    Path => '{{resolve:secretsmanager:MySecret}}',
  };
  resource User4 => 'AWS::IAM::User', {
    Path => '{{resolve:secretsmanager:MySecret:SecretString:password}}',
  };
  resource User5 => 'AWS::IAM::User', {
    Path => '{{resolve:secretsmanager:MySecret:SecretString:password:SecretString:EXAMPLE1-90ab-cdef-fedc-ba987EXAMPLE}}',
  };
  resource User6 => 'AWS::IAM::User', {
    Path => '{{resolve:secretsmanager:arn:aws:secretsmanager:us-west-2:123456789012:secret:MySecret-asd123:SecretString:password}}',
  };
  resource User7 => 'AWS::IAM::User', {
    Path => '{{resolve:secretsmanager:arn:aws:secretsmanager:us-west-2:123456789012:secret:MySecretName-asd123:SecretString:password:AWSPENDING}}',
  };
}

my $obj = TestClass->new;

isa_ok($obj->User1->Properties->LoginProfile->Password, 'Cfn::DynamicSecureSSMParameter');
isa_ok($obj->User1->Properties->Path, 'Cfn::DynamicSecureSSMParameter');
isa_ok($obj->User1_1->Properties->LoginProfile->Password, 'Cfn::DynamicSSMParameter');
isa_ok($obj->User1_1->Properties->Path, 'Cfn::DynamicSSMParameter');
isa_ok($obj->User2->Properties->LoginProfile->Password, 'Cfn::DynamicSecretsManager');
isa_ok($obj->User2->Properties->Path, 'Cfn::DynamicSecretsManager');

isa_ok($obj->User3->Properties->Path, 'Cfn::DynamicSecretsManager');
isa_ok($obj->User4->Properties->Path, 'Cfn::DynamicSecretsManager');
isa_ok($obj->User5->Properties->Path, 'Cfn::DynamicSecretsManager');
isa_ok($obj->User6->Properties->Path, 'Cfn::DynamicSecretsManager');
isa_ok($obj->User7->Properties->Path, 'Cfn::DynamicSecretsManager');

cmp_ok($obj->as_hashref->{ Resources }->{ User1 }->{ Properties }->{ LoginProfile }->{ Password }, 'eq', '{{resolve:ssm-secure:IAMUserPassword:10}}');
cmp_ok($obj->as_hashref->{ Resources }->{ User1_1 }->{ Properties }->{ LoginProfile }->{ Password }, 'eq', '{{resolve:ssm:IAMUserPassword:10}}');
cmp_ok($obj->as_hashref->{ Resources }->{ User2 }->{ Properties }->{ LoginProfile }->{ Password }, 'eq', '{{resolve:secretsmanager:MyRDSSecret:SecretString:username}}');

sub path_for_user {
  my ($obj, $obj_name) = @_;
  $obj->as_hashref->{ Resources }->{ $obj_name }->{ Properties }->{ Path };
}
cmp_ok(path_for_user($obj, 'User2'), 'eq', '{{resolve:secretsmanager:MyRDSSecret:SecretString:username}}');
cmp_ok(path_for_user($obj, 'User3'), 'eq', '{{resolve:secretsmanager:MySecret}}');
cmp_ok(path_for_user($obj, 'User4'), 'eq', '{{resolve:secretsmanager:MySecret:SecretString:password}}');
cmp_ok(path_for_user($obj, 'User5'), 'eq', '{{resolve:secretsmanager:MySecret:SecretString:password:SecretString:EXAMPLE1-90ab-cdef-fedc-ba987EXAMPLE}}');
cmp_ok(path_for_user($obj, 'User6'), 'eq', '{{resolve:secretsmanager:arn:aws:secretsmanager:us-west-2:123456789012:secret:MySecret-asd123:SecretString:password}}');
cmp_ok(path_for_user($obj, 'User7'), 'eq', '{{resolve:secretsmanager:arn:aws:secretsmanager:us-west-2:123456789012:secret:MySecretName-asd123:SecretString:password:AWSPENDING}}');

foreach my $test ([ 'AWS::DirectoryService::MicrosoftAD', '', 'Password' ],
                  [ 'AWS::DirectoryService::SimpleAD', '', 'Password' ],
                  [ 'AWS::ElastiCache::ReplicationGroup', '', 'AuthToken' ],
                  [ 'AWS::IAM::User', 'LoginProfile', 'Password' ],
                  [ 'AWS::KinesisFirehose::DeliveryStream', 'RedshiftDestinationConfiguration', 'Password' ],
                  [ 'AWS::OpsWorks::App', 'AppSource', 'Password' ],
                  [ 'AWS::OpsWorks::Stack', 'CustomCookbooksSource', 'Password' ],
                  [ 'AWS::OpsWorks::Stack', 'RdsDbInstances', 'Password' ],
                  [ 'AWS::RDS::DBCluster', '', 'MasterUserPassword' ],
                  [ 'AWS::RDS::DBInstance', '', 'MasterUserPassword' ],
                  [ 'AWS::Redshift::Cluster', '', 'MasterUserPassword' ]) {

}

done_testing; 

