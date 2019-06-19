#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;
use Cfn;

my $obj = Cfn->new;

$obj->addResource(
  User1 => 'AWS::IAM::User', {
    UserName => 'myuser',
    Path => '{{resolve:ssm-secure:IAMUserPassword:10}}',
    LoginProfile => {
      Password => '{{resolve:ssm-secure:IAMUserPassword:10}}',
    }
  }
);

$obj->addResource(
  User1_1 => 'AWS::IAM::User', {
    UserName => 'myuser',
    Path => '{{resolve:ssm:IAMUserPassword:10}}',
    LoginProfile => {
      Password => '{{resolve:ssm:IAMUserPassword:10}}',
    }
  }
);

$obj->addResource(
  User2 => 'AWS::IAM::User', {
    UserName => 'myuser',
    Path => '{{resolve:secretsmanager:MyRDSSecret:SecretString:username}}',
    LoginProfile => {
      Password => '{{resolve:secretsmanager:MyRDSSecret:SecretString:username}}',
    }
  }
);
  
$obj->addResource(
  User3 => 'AWS::IAM::User', {
    Path => '{{resolve:secretsmanager:MySecret}}',
  }
);

$obj->addResource(
  User4 => 'AWS::IAM::User', {
    Path => '{{resolve:secretsmanager:MySecret:SecretString:password}}',
  }
);

$obj->addResource(
  User5 => 'AWS::IAM::User', {
    Path => '{{resolve:secretsmanager:MySecret:SecretString:password:SecretString:EXAMPLE1-90ab-cdef-fedc-ba987EXAMPLE}}',
  }
);

$obj->addResource(
  User6 => 'AWS::IAM::User', {
    Path => '{{resolve:secretsmanager:arn:aws:secretsmanager:us-west-2:123456789012:secret:MySecret-asd123:SecretString:password}}',
  }
);

$obj->addResource(
  User7 => 'AWS::IAM::User', {
    Path => '{{resolve:secretsmanager:arn:aws:secretsmanager:us-west-2:123456789012:secret:MySecretName-asd123:SecretString:password:AWSPENDING}}',
  }
);

isa_ok($obj->Resource('User1')->Properties->LoginProfile->Password, 'Cfn::DynamicSecureSSMParameter');
isa_ok($obj->Resource('User1')->Properties->Path, 'Cfn::DynamicSecureSSMParameter');
isa_ok($obj->Resource('User1_1')->Properties->LoginProfile->Password, 'Cfn::DynamicSSMParameter');
isa_ok($obj->Resource('User1_1')->Properties->Path, 'Cfn::DynamicSSMParameter');
isa_ok($obj->Resource('User2')->Properties->LoginProfile->Password, 'Cfn::DynamicSecretsManager');
isa_ok($obj->Resource('User2')->Properties->Path, 'Cfn::DynamicSecretsManager');

isa_ok($obj->Resource('User3')->Properties->Path, 'Cfn::DynamicSecretsManager');
isa_ok($obj->Resource('User4')->Properties->Path, 'Cfn::DynamicSecretsManager');
isa_ok($obj->Resource('User5')->Properties->Path, 'Cfn::DynamicSecretsManager');
isa_ok($obj->Resource('User6')->Properties->Path, 'Cfn::DynamicSecretsManager');
isa_ok($obj->Resource('User7')->Properties->Path, 'Cfn::DynamicSecretsManager');

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

# documentation states the the only objects that the only properties to 
# support ssm-secure dynamic references are in the 
# "Resources that Support Dynamic Parameter Patterns for Secure Strings" section of
# https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/dynamic-references.html
foreach my $test ([ 'AWS::DirectoryService::MicrosoftAD', 
                    '', 'Password', 
                    [ Name => 'X', VpcSettings => { VpcId => 'X', SubnetIds => [] } ]
                  ],
                  [ 'AWS::DirectoryService::SimpleAD',
                    '', 'Password',
                    [ Size => 'X', Name => 'X', VpcSettings => { VpcId => 'X', SubnetIds => [] } ]
                  ],
                  [ 'AWS::ElastiCache::ReplicationGroup',
                    '', 'AuthToken',
                    [ ReplicationGroupDescription => 'X', ]
                  ],
                  [ 'AWS::IAM::User', 'LoginProfile', 'Password' ],
                  [ 'AWS::KinesisFirehose::DeliveryStream',
                    'RedshiftDestinationConfiguration', 'Password',
                    [ RedshiftDestinationConfiguration => {
                        S3Configuration => {
                          BucketARN => 'x',
                          BufferingHints => {
                            IntervalInSeconds => 5,
                            SizeInMBs => 5,
                          },
                          CompressionFormat => 'x',
                          RoleARN => 'x',
                        },
                        RoleARN => 'x',
                        CopyCommand => {
                          DataTableName => 'X',
                        },
                        ClusterJDBCURL => 'x',
                        Username => 'x',
                      },
                    ],
                  ],
                  [ 'AWS::OpsWorks::App',
                    'AppSource', 'Password',
                    [ 
                      Type => 'x',
                      StackId => 'x',
                      Name => 'x',
                    ],
                  ],
                  [ 'AWS::OpsWorks::Stack',
                    'CustomCookbooksSource', 'Password',
                    [ ServiceRoleArn => 'y',
                      Name => 'x',
                      DefaultInstanceProfileArn => 'arn',
                    ],
                  ],
                  [ 'AWS::OpsWorks::Stack',
                    'RdsDbInstances.0', 'DbPassword',
                    [ ServiceRoleArn => 'y',
                      Name => 'x',
                      DefaultInstanceProfileArn => 'arn',
                      RdsDbInstances => [ { RdsDbInstanceArn => 'x', DbUser => 'x' } ],
                    ],
                  ],
                  [ 'AWS::RDS::DBCluster',
                    '', 'MasterUserPassword',
                    [ Engine => 'x', ],
                  ],
                  [ 'AWS::RDS::DBInstance',
                    '', 'MasterUserPassword',
                    [ DBInstanceClass => 'x',
                    ],
                  ],
                  [ 'AWS::Redshift::Cluster',
                    '', 'MasterUserPassword',
                    [ MasterUsername => 'x',
                      DBName => 'x',
                      ClusterType => 'x',
                      NodeType => 'x',
                    ],
                  ]) {
  my $cfn = Cfn->new;

  my $object_type = $test->[0];
  my %properties;
  my $one_step = $test->[1] eq '';
  my $first_accessor = $one_step ? $test->[2] : $test->[1];
  my $second_accessor = $test->[2];

  my %params = @{ $test->[3] } if (defined $test->[3]);

  if ($one_step) {
    $params{ $first_accessor } = '{{resolve:ssm-secure:IAMUserPassword:10}}';
  } else {
    if ($first_accessor =~ m/\.0$/){
      my $local_accessor = $first_accessor;
      $local_accessor =~ s/\.0//;
      $params{ $local_accessor }->[0]->{ $second_accessor } = '{{resolve:ssm-secure:IAMUserPassword:10}}';
    } else {
      $params{ $first_accessor }->{ $second_accessor } = '{{resolve:ssm-secure:IAMUserPassword:10}}';
    }
  }

  note "Creating a $object_type";

  $cfn->addResource('R', $object_type, %params);

  if ($one_step) {
    isa_ok($cfn->Resource('R')->Properties->$first_accessor, 'Cfn::DynamicSecureSSMParameter');
  } else {
    if ($first_accessor =~ m/\.0$/){
      my $local_accessor = $first_accessor;
      $local_accessor =~ s/\.0//;
      isa_ok($cfn->Resource('R')->Properties->$local_accessor->Value->[0]->$second_accessor, 
             'Cfn::DynamicSecureSSMParameter');
    } else {
      isa_ok($cfn->Resource('R')->Properties->$first_accessor->$second_accessor, 
             'Cfn::DynamicSecureSSMParameter');
    }
  }
}

done_testing;
