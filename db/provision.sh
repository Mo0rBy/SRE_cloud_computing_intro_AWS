!#/bin/bash

#THIS IS A PROVSIONING SCRIPT

#Sets up machine (ensures all things work)
sudo apt-get update -y
sudo apt-get upgrade -y

#Adding MongoDB Repo
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
sudo apt-get update

#Install and verify MongoDB
sudo apt-get install -y mongodb-org

#Change the Mongodb config file
sudo rm /etc/mongod.conf
sudo ln -s /home/ubuntu/provision/mongod.conf /etc/mongod.conf

#Start MongoDB
sudo systemctl start mongod

sudo systemctl enable mongod