#!/usr/bin/env bash


# Note: create the instance first and assign it an instance role that has the permissions required to run the terraform scripts.


# Update Yum:

sudo yum update -y

# Install Jenkins:

sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum install jenkins -y

# Install git and set up for instance profile credentials:

sudo yum install git -y
git config --global credential.helper '!aws codecommit credential-helper $@'
git config --global credential.UseHttpPath true

sudo cp ~/.gitconfig ~jenkins/
sudo chown jenkins:jenkins ~jenkins/.gitconfig


sudo yum install zip -y
sudo yum install unzip -y

# Install Java 8 and remove 7:

sudo yum install java-1.8.0 -y
sudo yum remove java-1.7.0-openjdk -y


# Install SBT
curl https://bintray.com/sbt/rpm/rpm | sudo tee /etc/yum.repos.d/bintray-sbt-rpm.repo
sudo yum install sbt -y

# Set jenkins user to not require password for sudo

echo 'jenkins ALL=(ALL) NOPASSWD: ALL' | sudo tee -a /etc/sudoers

# Install terraform:

cd ~
mkdir tmp
cd tmp
wget https://releases.hashicorp.com/terraform/0.10.7/terraform_0.10.7_linux_amd64.zip\?_ga\=2.59025069.1480222251.1507555061-1677932597.1492635746
unzip terraform_*
sudo mv terraform /usr/bin/

sudo service jenkins start

