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

# Remove the default nginx config file and replace it with the config file that is passed fro the localhost machine
# Use `ln` (link) to give the desired file an extra path (the default config file path)
sudo rm /etc/nginx/sites-available/default
sudo ln -s /home/ubuntu/provision/default.txt /etc/nginx/sites-available/default

#Restart nginx to implement config changes
sudo systemctl restart nginx

#Write DB_HOST variable to /etc/environment file (Ensures persistent environment variable)
echo "DB_HOST=mongodb://192.168.10.150:27017/posts" | sudo tee -a /etc/environment

#Viktor says this doesn't work, has to be done manually
#Add DB_HOST env variable
# export DB_HOST=192.168.10.150:27017/posts
# echo "DB_HOST=192.168.10.150:27017/posts" >> ~/.bashrc
# source ~/.bashrc

#Start the app
# npm start