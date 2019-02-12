{
  "Type" : "AWS::IAM::ManagedPolicy",
  "Properties" : {
    "Description" : "Policy for creating a test database",
    "Path" : "/",
    "PolicyDocument" :   {
      "Version":"2012-10-17", 
      "Statement" : [{
        "Effect" : "Allow",           
        "Action" : "rds:CreateDBInstance",
        "Resource" : {"Fn::Join" : [ "", [ "arn:aws:rds:", { "Ref" : "AWS::Region" }, ":", { "Ref" : "AWS::AccountId" }, ":db:test*" ] ]}, 
        "Condition" : {
          "StringEquals" : { "rds:DatabaseEngine" : "mysql" }
        }
      },
      {
        "Effect" : "Allow",           
        "Action" : "rds:CreateDBInstance",
        "Resource" : {"Fn::Join" : [ "", [ "arn:aws:rds:", { "Ref" : "AWS::Region" }, ":", { "Ref" : "AWS::Region" }, ":db:test*" ] ]}, 
        "Condition" : {
          "StringEquals" : { "rds:DatabaseClass" : "db.t2.micro" }
        }
      }]
    },
    "Groups" : ["TestDBGroup"]
  }
}
