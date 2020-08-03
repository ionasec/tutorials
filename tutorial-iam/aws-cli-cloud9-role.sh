#change cloud9 instance role to admin role
#https://docs.aws.amazon.com/cloud9/latest/user-guide/credentials.html#credentials-temporary-attach-console
#edit the role name and ec2 instance id
aws ec2 associate-iam-instance-profile --iam-instance-profile Name=raz-cloud9-admin-role --region eu-central-1 --instance-id i-0a9495442cc897923
aws configure