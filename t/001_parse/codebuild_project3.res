{
      "Type": "AWS::CodeBuild::Project",
      "Properties": {
        "ServiceRole": {
          "Fn::GetAtt": [
            "CodeBuildRole",
            "Arn"
          ]
        },
        "Artifacts": {
          "Type": "CODEPIPELINE"
        },
        "Environment": {
          "Type": "LINUX_CONTAINER",
          "ComputeType": "BUILD_GENERAL1_SMALL",
          "Image": "aws/codebuild/ubuntu-base:14.04",
          "EnvironmentVariables": [
            {
              "Name": "varName1",
              "Value": "varValue1"
            },
            {
              "Name": "varName2",
              "Value": "varValue2",
              "Type": "PLAINTEXT"
            },
            {
              "Name": "varName3",
              "Value": "/CodeBuild/testParameter",
              "Type": "PARAMETER_STORE"
            }
          ]
        },
        "Source": {
          "Type": "CODEPIPELINE"
        },
        "TimeoutInMinutes": 10,
        "VpcConfig": {
          "VpcId": {
            "Ref": "CodeBuildVPC"
          },
          "Subnets": [
            {
              "Ref": "CodeBuildSubnet"
            }
          ],
          "SecurityGroupIds": [
            {
              "Ref": "CodeBuildSecurityGroup"
            }
          ]
        },
        "Cache": {
          "Type": "S3",
          "Location": "mybucket/prefix"
        }
      }
    }
