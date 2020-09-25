sudo yum -y install git
sudo yum -y install httpd

sudo service httpd start  

sudo mkdir /var/www/html/mount-point

cd /var/www/html/mount-point
cd ..

sudo chown ec2-user mount-point
chmod -R o+r mount-point/ 

cd mount-point/

git clone https://github.com/ionasec/tutorials.git
cd tutorials/tutorial-shiftmedical2020
git clone https://github.com/aws-samples/amazon-sumerian-hosts.git
cp three.html amazon-sumerian-hosts/examples/


http://18.184.25.89/mount-point/tutorials/tutorial-shiftmedical2020/amazon-sumerian-hosts/examples/three.html