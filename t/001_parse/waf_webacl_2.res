{
  "Type": "AWS::WAF::WebACL",
  "Properties": {
    "Name": "WebACL to with three rules",
    "DefaultAction": {
      "Type": "ALLOW"
    },
    "MetricName" : "MyWebACL",
    "Rules": [
      {
        "Action" : {
          "Type" : "BLOCK"
        },
        "Priority" : 1,
        "RuleId" : { "Ref" : "MyRule" }
      },
      {
        "Action" : {
          "Type" : "BLOCK"
        },
        "Priority" : 2,
        "RuleId" : { "Ref" : "BadReferersRule" }
      },
      {
        "Action" : {
          "Type" : "BLOCK"
        },
        "Priority" : 3,
        "RuleId" : { "Ref" : "SqlInjRule" }
      }
    ]
  }      
}
