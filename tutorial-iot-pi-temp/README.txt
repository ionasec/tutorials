
https://towardsdatascience.com/how-i-built-a-tiny-real-time-telematics-application-on-aws-a9956f5afe65


#step1 install IOT GreenGrass on Device
https://docs.aws.amazon.com/greengrass/latest/developerguide/quick-start.html

export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
export AWS_SESSION_TOKEN=AQoDYXdzEJr1K...o5OytwEXAMPLE=

wget -q -O ./gg-device-setup-latest.sh https://d1onfpft10uf5o.cloudfront.net/greengrass-device-setup/downloads/gg-device-setup-latest.sh && chmod +x ./gg-device-setup-latest.sh && sudo -E ./gg-device-setup-latest.sh bootstrap-greengrass-interactive
sudo -E ./gg-device-setup-latest.sh bootstrap-greengrass-interactive


#step 2 start greengrass on device
https://docs.aws.amazon.com/greengrass/latest/developerguide/gg-device-start.html
cd /greengrass/ggc/core/
sudo ./greengrassd start

#step 3 install greengrass sdk to dev env
git clone https://github.com/aws/aws-greengrass-core-sdk-python.git


#step 4 package lambda

#step 5 install dependencies
https://aws.amazon.com/premiumsupport/knowledge-center/build-python-lambda-deployment-package/
pip install boto3 -t ./
chmod -R 755 .
zip -r ../myDeploymentPackage.zip .
aws s3 cp myDeploymentPackage2.zip s3://raz-eu-central-1-tutorial/myDeploymentPackage2.zip

#step 4 debug lambda
https://read.acloud.guru/aws-greengrass-pro-tips-4ef231821f9#1487
ps aux | grep lambda_runtime
sudo nsenter -t $PID -m /bin/bash

step 6 insert values into dynomodb
https://docs.aws.amazon.com/iot/latest/developerguide/iot-ddb-rule.html

step 7 use IOT analytics
https://aws.amazon.com/blogs/iot/using-aws-iot-analytics-to-prepare-data-for-quicksight-time-series-visualizations/
