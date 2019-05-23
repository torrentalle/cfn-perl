#!/usr/bin/env perl

use Cfn;
use Test::More;
use Test::Exception;

my $content = <<EOF;
{
  "AWSTemplateFormatVersion" : "2010-09-09",

  "Description" : "",

  "Parameters" : {
    "KeyPair" : {
      "Description" : "Amazon EC2 Key Pair",
      "Type" : "AWS::EC2::KeyPair::KeyName",
      "Description" : ""
    }
  },

  "Resources" : {
    "WebServerSecurityGroup" : {
      "Type" : "AWS::EC2::SecurityGroup",
      "Properties" : {
        "GroupDescription" : "Enable HTTP, HTTPS and SSH access",
        "VpcId" : {"Ref" : "VpcId"},
        "SecurityGroupIngress" : [
          {"IpProtocol" : "tcp", "FromPort" : "22", "ToPort" : "22", "CidrIp" : "0.0.0.0/0"}
        ]
      }
    }
  },
  
  "Outputs" : {
  }
}
EOF

throws_ok(sub { Cfn->from_json($content) }, qr/Duplicate keys not allowed/);

done_testing;

