#https://github.com/aws-samples/amazon-rekognition-video-analyzer

sudo pip install opencv-contrib-python
sudo pip install boto3 
sudo pip install pynt
git clone https://github.com/aws-samples/amazon-rekognition-video-analyzer.git

#overview lambda and config folders

sudo pip install pytz
# Install pytz to be packaged and deployed with the Image Processor lambda function
sudo pip install pytz -t /lambda/imageprocessor/

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

pynt webuiserver # Starts lightweight HTTP Server on port 8080.

pynt videocaptureip["http://ionasec.tplinkdns.com:8000/update.html",5]
pynt videocaptureip["http://192.168.1.116:8000",5]
pynt videocapture[5]