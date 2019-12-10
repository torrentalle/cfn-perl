{
        "Type": "AWS::ApiGatewayV2::Stage",
        "Properties": {
            "StageName": "Prod",
            "Description": "Prod Stage",
            "DeploymentId": {
                "Ref": "MyDeployment"
            },
            "ApiId": {
                "Ref": "CFNWebSocket"
            },
            "DefaultRouteSettings": {
                "DetailedMetricsEnabled": true,
                "LoggingLevel": "INFO",
                "DataTraceEnabled": true,
                "ThrottlingBurstLimit": 10,
                "ThrottlingRateLimit": 10
            },
            "AccessLogSettings": {
                "DestinationArn": "arn:aws:logs:us-east-1:123456789:log-group:my-log-group",
                "Format": "{\"requestId\":\"$context.requestId\", \"ip\": \"$context.identity.sourceIp\", \"caller\":\"$context.identity.caller\", \"user\":\"$context.identity.user\",\"requestTime\":\"$context.requestTime\", \"eventType\":\"$context.eventType\",\"routeKey\":\"$context.routeKey\", \"status\":\"$context.status\",\"connectionId\":\"$context.connectionId\"}"
            }
        }
    }
