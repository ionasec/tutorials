https://docs.sumerian.amazonaws.com/tutorials/create/solutions/sumerian-hosts-three/

https://docs.aws.amazon.com/sdk-for-javascript/v2/developer-guide/getting-started-browser.html

Step 1: Create an Amazon Cognito Identity Pool

raz_sumerian_identitiy_pool

Cognito_raz_sumerian_identitiy_poolUnauth_Role

// Initialize the Amazon Cognito credentials provider
AWS.config.region = 'eu-central-1'; // Region
AWS.config.credentials = new AWS.CognitoIdentityCredentials({
    IdentityPoolId: 'eu-central-1:a2181859-3b91-486e-acfe-0516c054ed86',
});

Step 2: Add a Policy to the Created IAM Role

To add an Amazon Polly policy to the IAM role associated with unauthenticated users

Step 3: Create the HTML Page
