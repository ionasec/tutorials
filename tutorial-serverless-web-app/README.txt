https://aws.amazon.com/getting-started/hands-on/build-serverless-web-app-lambda-apigateway-s3-dynamodb-cognito/


#setup a custom domain with amplify
https://docs.aws.amazon.com/amplify/latest/userguide/custom-domains.html


#unicore ride code
aws s3 cp s3://wildrydes-us-east-1/WebApplication/1_StaticWebHosting/website ./ --recursive

#used authentification with cognito
# You can use Cognito User Pools to add sign-up and sign-in functionality to your application or use Cognito Identity Pools to authenticate users through social identity providers such as Facebook, Twitter, or Amazon, with SAML identity solutions, or by using your own identity system.

#create user pool https://docs.aws.amazon.com/cli/latest/reference/cognito-idp/create-user-pool.html
aws cognito-idp create-user-pool --pool-name raz-user-pool

#create user pool client
aws cognito-idp create-user-pool-client --user-pool-id eu-central-1_Dioc5yjz8  --client-name raz-wildrydes-user-pool-client --no-generate-secret --explicit-auth-flows "USER_PASSWORD_AUTH"

#create dynamodb table
#https://aws.amazon.com/getting-started/hands-on/build-serverless-web-app-lambda-apigateway-s3-dynamodb-cognito/module-3/
#https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/getting-started-step-1.html

aws dynamodb create-table \
    --table-name Rides \
    --attribute-definitions \
        AttributeName=RideId,AttributeType=S \
    --key-schema \
        AttributeName=RideId,KeyType=HASH \
    --provisioned-throughput \
        ReadCapacityUnits=10,WriteCapacityUnits=5
        
#create IAM role for lambda functionality
aws iam create-role --role-name raz-lambda-WildRydesLambda --assume-role-policy-document '{"Version": "2012-10-17","Statement": [{ "Effect": "Allow", "Principal": {"Service": "lambda.amazonaws.com"}, "Action": "sts:AssumeRole"}]}'

aws iam attach-role-policy --role-name raz-lambda-WildRydesLambda --policy-arn arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole

#put inline policy into role
#https://docs.aws.amazon.com/ja_jp/cli/latest/reference/iam/put-role-policy.html

aws iam put-role-policy --role-name raz-lambda-WildRydesLambda --policy-name raz-inlinepolicy --policy-document file:~/environment/tutorials/tutorial-serverless-web-app/policy/lambda-policy-DynamoDBWriteAccess.json


#Create a Lambda function with the create-function command. Replace the highlighted text in the role ARN with your account ID.
aws lambda create-function --function-name raz-WildRydesLambda \
--zip-file fileb://~/environment/tutorials/tutorial-serverless-web-app/lambda/funcion.zip --handler index.handler --runtime nodejs12.x \
--role arn:aws:iam::773208840593:role/raz-lambda-WildRydesLambda

#test lambda
aws lambda invoke --function-name raz-WildRydesLambda --payload file://~/environment/tutorials/tutorial-serverless-web-app/lambda/test-payload.json out.txt

#https://aws.amazon.com/getting-started/hands-on/build-serverless-web-app-lambda-apigateway-s3-dynamodb-cognito/module-4/
#create api gatway
aws apigateway create-rest-api --name 'raz-apigateway-WildRydes' --description 'This is my first WildRydes API'
 
#create authorizer
#https://docs.aws.amazon.com/cli/latest/reference/apigateway/create-authorizer.html
aws apigateway create-authorizer --rest-api-id 7uw5eb3qd3 --name 'raz_Cognito_Custom_Authorizer' --type COGNITO_USER_POOLS --provider-arns 'arn:aws:cognito-idp:eu-central-1:773208840593:userpool/eu-central-1_27NSM9Hll' --identity-source 'method.request.header.Authorization'

#create Apigateway resource
aws apigateway create-resource --rest-api-id 7uw5eb3qd3 --parent-id 1hqsi2lpg3 --path-part 'ride'

#create apigateway method for resource
https://docs.aws.amazon.com/cli/latest/reference/apigateway/put-integration.html
aws apigateway put-integration --rest-api-id 7uw5eb3qd3 --resource-id 1faur0 --http-method GET --type AWS --integration-http-method POST \
--uri 'arn:aws:lambda:eu-central-1:773208840593:function:raz-WildRydesLambda'

#create deployment of api
aws apigateway create-deployment --region eu-central-1 \
    --rest-api-id 7uw5eb3qd3 \
    --stage-name prod
    
#update invokation of API gatway
#https://aws.amazon.com/getting-started/hands-on/build-serverless-web-app-lambda-apigateway-s3-dynamodb-cognito/module-4/
https://7uw5eb3qd3.execute-api.eu-central-1.amazonaws.com/prod