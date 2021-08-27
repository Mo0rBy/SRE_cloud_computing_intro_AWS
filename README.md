# SRE Introduction
## Cloud Computing with AWS
### SDLC
#### Risk factors with SDLC stages
##### Monitoring

### Key Advantages:
- Ease of use
- Flexibility
- Robustness
- Cost

**SRE Introduction**
- What is the role of an SRE?

    - The role of SRE is            predominantly to ensure reliability of online services.

    - This done using automation of scaling and load-balancing.

    - If a problem is going to occur, the goal is fix the problem before it affects any end-users, such that they never realise that a problem occured.


**Cloud Computing**
- What is cloud computing and the benefits of using it?

    - The 4 key advantages of cloud-computing are:

        - Ease of use
        - Flexibility
        - Robustness
        - Cost Savings

        Other advantages include:

        - Increased security
        - Better insight
        - Increased collaboration
        - Quality control


**What is Amazon Web Service? (AWS)**
- What is AWS and the benefits of using it?

    AWS is an on-demand cloud computig platform available to individuals, companies and governments on a pay-as-you-go basis.

    - AWS services offer tools for compute power, database storage and content delivery services.

    - The different services are configured in different ways to suit a user's needs.

        - Easy to use
        - Flexible
        - Cost-Effective
        - Reliable
        - Scalable and high-performance
        - Secure


**What is SDLC and the stages of SDLC?**
- What is SDLC and the stages of it?

    SDLC refers to a methodology with clearly defined process for creating high-quality software. Includes the following phases:

    - Requirements analysis
    - Planning
    - Software design (Architectural design)
    - Software development
    - Testing
    - Deployment

**What is the risk level at each stage of SDLC?**
- LOW
- MEDIUM
- HIGH

---


SDLC Representation

---
![alt text](https://datarob.com/content/images/2019/08/SDLC-stages.png)

---
### Types of cloud-computing


- On-premise:
    
    On-premise (inhouse) technologies require large capital investment and operating costs. This includes, construction of the data centre, purchasing and setting up the hardware, security and staff training. All these costs add up to a potentially very large amount.

- Cloud-computing:

    Cloud-computing involves renting virtual server space to decrease the cost of hosting online services. 
    For example, with AWS, Amazon builds it's data centres and populates them with hardware and trains its own staff. The customer then pays a fee (subscription or pay-as-you-go) to access these services. This can dramatically decrease cost.

---
![alt text](https://www.peoplehr.com/blog/wp-content/uploads/2015/06/12.png)

---

- Hybrid Cloud-computing:

    Hybrid cloud-computing involves using a public cloud service provider, as well as controlling a private cloud using on-premise infrastructure. This is done to reduce costs and/or strain on local resources. In some sectors, it is done to comply with legal regulations. The financial and health care spaces are in possesion of large amounts of private data, and can therefore benegfit from using a hybrid cloud model.

---
![alt text](https://qph.fs.quoracdn.net/main-qimg-8e9ed422b2ae93823c754ea345da004e)

---

- Multi Cloud-computing:

    Multi cloud-computing involves using the services of 2 or more cloud service providers. Communication can occur between the 2 providers for data migration and other services. 
    Doing this ensures that data can be kept safe and accessed at all times. If one of the providers fail for some reason, the other provider will be able to "pick up the slack".

---
### Provisiong in Vagrant

Within the VagrantFile, add the following line:
```
config.vm.provision "shell", path: "provision.sh"
```

Create a file named "provision.sh" within the same directory as the "VagrantFile". The script should be:
```
!#/bin/bash

sudo apt-get update -y

sudo apt-get upgrade -y

sudo apt-get install nginx -y
```
**THIS MUST BEGIN WITH THE BANG LINE**

---
- install npm `sudo apt-get install npm -y`
- install python-software-properties `sudo apt-get install python-software-properties -y`
- new source for nodejs `curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -`
- install nodejs `sudo apt-get install nodejs -y`
- Change to the app directory
- Inside the app directory, install pm2 `sudo npm install pm2 -g -y`
- Install some relevant npm package files (app will throw an error if this is not done) `npm install`
- Run npm (again this is in the app directory) `npm start`

---
#### Friday Notes

Connect the NGINX VM to the Mongodb VM using an "Environment Variable" called `DB_HOST`

- Create a multi-machine setup
- One machine with node app provisionsin the second VM with mongodb.

- Configure reverse proxy with nginx so the app can load on the ip without the 3000

---
Setup DB_HOST env variable
```
export DB_HOST=192.168.10.150:27017/posts
echo export DB_HOST=192.168.10.150:27017/posts >> ~/.bashrc
source ~/.bashrc
```
2nd line adds the command to .bashrc

---
### Setup reverse proxy on nginx

Access the nginx configuration file
```
sudo nano /etc/nginx/sites-available/default
```

Then change the default location that nginx takes the user to
```
location / {
        proxy_pass http://localhost:3000
```
Then check that the file has no syntax errors using `sudo nginx -t`
Restart nginx with `sudo systemctl restart nginx`
This needs to be done in order to run the changes made in the configuration file
The app can then be started with `npm start`
In your browser, navigate to `192.168.10.100`. Instead of seeing the nginx front page, you should see the app's front .

Could use AWK or SED to automate writing in the config file in provision.sh for the VM (add later)

---

