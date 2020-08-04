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
