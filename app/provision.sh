!#/bin/bash

#THIS IS A PROVSIONING SCRIPT

#Sets up machine (ensures all things work)
sudo apt-get update -y
sudo apt-get upgrade -y

#Install nginx package
sudo apt-get install nginx -y

#Install and setup npm and nodejs
sudo apt-get install npm -y
sudo apt-get install python-software-properties -y
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install nodejs -y
#Change to the app directory
cd /home/ubuntu/app
sudo npm install pm2 -g -y
npm install
#Don't need to npm start, want to change the nginx config file

#Add DB_HOST env variable
export "DB_HOST=192.168.10.150:27017/posts"
sudo echo "export DB_HOST=192.168.10.150:27017/posts" >> ~/.bashrc
sudo source ~/.bashrc