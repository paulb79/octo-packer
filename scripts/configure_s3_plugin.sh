#!/usr/bin/env bash

export JENKINS_HOST=`hostname`

cd ~/tmp
wget http://${JENKINS_HOST}:8080/jnlpJars/jenkins-cli.jar


pass=`sudo cat /var/lib/jenkins/secrets/initialAdminPassword`
cat ./configure_s3_plugin.groovy | sudo java -jar jenkins-cli.jar -auth admin:$pass -s http://${JENKINS_HOST}:8080/ groovy =

cd ~