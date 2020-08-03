aws iam create-role --role-name lambda-ex --assume-role-policy-document file://trust-policy.json

aws iam create-role --role-name lambda-ex --assume-role-policy-document '{"Version": "2012-10-17","Statement": [{ "Effect": "Allow", "Principal": {"Service": "lambda.amazonaws.com"}, "Action": "sts:AssumeRole"}]}'

aws iam attach-role-policy --role-name lambda-ex --policy-arn arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole


aws ec2 describe-instances --region eu-central-1 --filters Name=tag:Name,Values="raz-cloud9-fra" --query "Reservations[*].Instances[*].InstanceId" --output text

#change cloud9 instance role to admin role
#https://docs.aws.amazon.com/cloud9/latest/user-guide/credentials.html#credentials-temporary-attach-console
#edit the role name and ec2 instance id
aws ec2 associate-iam-instance-profile --iam-instance-profile Name=raz-cloud9-admin-role --region eu-central-1 --instance-id i-0a9495442cc897923
aws configure