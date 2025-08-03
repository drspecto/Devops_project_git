#!/bin/bash
yum update -y
yum install -y git

# Install Node.js (Amazon Linux 2023)
curl -fsSL https://rpm.nodesource.com/setup_18.x | bash -
yum install -y nodejs

# Clone your repo and run the app
cd /home/ec2-user
git clone https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
cd YOUR_REPO_NAME/app
npm install
npm run build
npm install -g serve
serve -s build -l 3000
