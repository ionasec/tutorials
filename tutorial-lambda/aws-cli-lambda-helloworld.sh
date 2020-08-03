#https://docs.aws.amazon.com/lambda/latest/dg/gettingstarted-awscli.html

aws iam create-role --role-name raz-lambda-ex --assume-role-policy-document '{"Version": "2012-10-17","Statement": [{ "Effect": "Allow", "Principal": {"Service": "lambda.amazonaws.com"}, "Action": "sts:AssumeRole"}]}'

aws iam attach-role-policy --role-name raz-lambda-ex --policy-arn arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole

#zip function.zip index.js
zip function.zip index.js

#Create a Lambda function with the create-function command. Replace the highlighted text in the role ARN with your account ID.
aws lambda create-function --function-name raz-mylambda-function \
--zip-file fileb://~/environment/tutorial-lambda/tutorial-lambda/function.zip --handler index.handler --runtime nodejs12.x \
--role arn:aws:iam::773208840593:role/raz-lambda-ex

#To get logs for an invocation from the command line, use the --log-type option. The response includes a LogResult field that contains up to 4 KB of base64-encoded logs from the invocation.
aws lambda invoke --function-name raz-mylambda-function out --log-type Tail

aws lambda invoke --function-name raz-mylambda-function out --log-type Tail \
--query 'LogResult' --output text |  base64 -d

#Execute the following AWS CLI list-functions command to retrieve a list of functions that you have created.
aws lambda list-functions --max-items 10

#Retrieve a Lambda function
aws lambda get-function --function-name raz-mylambda-function

#delete-function command 
aws lambda delete-function --function-name raz-mylambda-function