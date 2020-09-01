#https://github.com/aws-samples/amazon-rekognition-video-analyzer

sudo pip install opencv-contrib-python
sudo pip install boto3 
sudo pip install pynt
git clone https://github.com/aws-samples/amazon-rekognition-video-analyzer.git
sudo pip install pytz
# Install pytz to be packaged and deployed with the Image Processor lambda function
sudo pip install pytz -t /amazon-rekognition-video-analyzer/lambda/imageprocessor/

#build the lambdas 
pynt packagelambda

# Deploy both functions to Amazon S3.
pynt deploylambda

# Create the cloud formation stack
pynt createstack

# Check status 
pynt stackstatus

#build webui
pynt webui