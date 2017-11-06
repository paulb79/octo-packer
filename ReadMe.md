# Octo Packer - Build the AMI for Jenkins

Build the AMI to be used for the Jenkins build server in AWS
The environment is based on Amazon AWS Linux environment. It uses the yum package manager. 

## Dependencies

1. packer
2. ruby 2.4+

## Install

Execute the following commands to setup your environment

1. git clone git@github.com:paulb79/octo-packer.git
2. cd to octo-packer
3. bundle install

## How to use

From the command line list the available commands:
rake -T

To create the AMI from the project root... 

export YOUR_AWS_PROFILE
rake create_jenkins_ami