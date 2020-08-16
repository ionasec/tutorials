https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-getting-started-hello-world.html

#Download a Sample AWS SAM Application
sam init

There are three especially important files:

template.yaml: Contains the AWS SAM template that defines your application's AWS resources.

hello_world/app.py: Contains your actual Lambda handler logic.

hello_world/requirements.txt: Contains any Python dependencies that the application requires, and is used for sam build.


First change into the project directory (that is, the directory where the template.yaml file for the sample application is located; by default is sam-app), then run this command:
sam build


Step 3: Deploy Your Application to the AWS Cloud
sam deploy --guided

Host Your API Locally
sam local start-api

Delete
aws cloudformation delete-stack --stack-name sam-app --region region
