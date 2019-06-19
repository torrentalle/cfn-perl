#!/usr/bin/env perl

use Test::More;

use Moose::Util::TypeConstraints qw/find_type_constraint/;

use strict;
use warnings;
use Cfn;

my $tests = [];

my $tc = find_type_constraint('Cfn::Value');
my $val = $tc->coerce('XXXX');
isa_ok($val, 'Cfn::Value::Primitive');

$val = $tc->coerce(1);
isa_ok($val, 'Cfn::Value::Primitive');

$val = $tc->coerce([2, 'YYYY']);
isa_ok($val, 'Cfn::Value::Array');
isa_ok($val->Value->[0], 'Cfn::Value::Primitive');
isa_ok($val->Value->[1], 'Cfn::Value::Primitive');

$val = $tc->coerce({ Ref => 'XXXX' });
isa_ok($val, 'Cfn::Value::Function');

$val = $tc->coerce([ 1, { Ref => 'X' }, 2 ]);
isa_ok($val, 'Cfn::Value::Array');
isa_ok($val->Value->[0], 'Cfn::Value::Primitive');
isa_ok($val->Value->[1], 'Cfn::Value::Function');
isa_ok($val->Value->[2], 'Cfn::Value::Primitive');


$val = $tc->coerce({ 'Fn::Join' => [ '.', [ 'A', 'B', { Ref => 'C' } ] ] });
isa_ok($val, 'Cfn::Value::Function');
my $cfn_array = $val->Value;
isa_ok($cfn_array, 'Cfn::Value::Array');
isa_ok($cfn_array->Value->[0], 'Cfn::Value::Primitive');
isa_ok($cfn_array->Value->[1], 'Cfn::Value::Array');
isa_ok($cfn_array->Value->[1]->Value->[0], 'Cfn::Value::Primitive');
isa_ok($cfn_array->Value->[1]->Value->[1], 'Cfn::Value::Primitive');
isa_ok($cfn_array->Value->[1]->Value->[2], 'Cfn::Value::Function');

$val = $tc->coerce({ 
  Key1 => "Value1",
  Key2 => "Value2",
  Key3 => "Value3"
});
isa_ok($val, 'Cfn::Value::Hash');

my $string_coerce = find_type_constraint('Cfn::Value::String');
{ 
  my $v = $string_coerce->coerce('XXXX');
  isa_ok($v, 'Cfn::String');
  cmp_ok($v->Value, 'eq', 'XXXX');
}

{ my $v = $string_coerce->coerce('{{resolve:ssm:IAMUser:10}}');
  isa_ok($v, 'Cfn::DynamicSSMParameter');
  cmp_ok($v->secure, '==', 0);
  cmp_ok($v->parameter, 'eq', 'IAMUser');
  cmp_ok($v->version, '==', 10);
  cmp_ok($v->as_hashref, 'eq', '{{resolve:ssm:IAMUser:10}}');
}
{ my $v = $string_coerce->coerce('{{resolve:ssm-secure:IAMUserPassword:42}}');
  isa_ok($v, 'Cfn::DynamicSecureSSMParameter');
  cmp_ok($v->secure, '==', 1);
  cmp_ok($v->parameter, 'eq', 'IAMUserPassword');
  cmp_ok($v->version, '==', 42);
  cmp_ok($v->as_hashref, 'eq', '{{resolve:ssm-secure:IAMUserPassword:42}}');
}
{ my $v = $string_coerce->coerce('{{resolve:secretsmanager:MySecret}}');
  isa_ok($v, 'Cfn::DynamicSecretsManager');
  cmp_ok($v->secret_id, 'eq', 'MySecret');
  cmp_ok($v->as_hashref, 'eq', '{{resolve:secretsmanager:MySecret}}');
}
{ my $v = $string_coerce->coerce('{{resolve:secretsmanager:MySecret::::}}');
  isa_ok($v, 'Cfn::DynamicSecretsManager');
  cmp_ok($v->secret_id, 'eq', 'MySecret');
  cmp_ok($v->as_hashref, 'eq', '{{resolve:secretsmanager:MySecret}}');
}
{ my $v = $string_coerce->coerce('{{resolve:secretsmanager:MySecret:SecretString:password}}');
  isa_ok($v, 'Cfn::DynamicSecretsManager');
  cmp_ok($v->secret_id, 'eq', 'MySecret');
  cmp_ok($v->secret_string, 'eq', 'SecretString');
  is_deeply($v->parameters, [ 'password' ]);
}
{ my $v = $string_coerce->coerce('{{resolve:secretsmanager:MySecret:SecretString:password:SecretString:EXAMPLE1-90ab-cdef-fedc-ba987EXAMPLE}}');
  isa_ok($v, 'Cfn::DynamicSecretsManager');
  cmp_ok($v->secret_id, 'eq', 'MySecret');
  cmp_ok($v->secret_string, 'eq', 'SecretString');
  is_deeply($v->parameters, [ 'password', 'SecretString', 'EXAMPLE1-90ab-cdef-fedc-ba987EXAMPLE' ]);
}
{ my $v = $string_coerce->coerce('{{resolve:secretsmanager:arn:aws:secretsmanager:us-west-2:123456789012:secret:MySecret-asd123:SecretString:password}}');
  isa_ok($v, 'Cfn::DynamicSecretsManager');
  cmp_ok($v->secret_id, 'eq', 'arn:aws:secretsmanager:us-west-2:123456789012:secret:MySecret-asd123');
  cmp_ok($v->secret_string, 'eq', 'SecretString');
  is_deeply($v->parameters, [ 'password' ]);
}
{ my $v = $string_coerce->coerce('{{resolve:secretsmanager:arn:aws:secretsmanager:us-west-2:123456789012:secret:MySecretName-asd123:SecretString:password:AWSPENDING}}');
  isa_ok($v, 'Cfn::DynamicSecretsManager');
}

done_testing();
