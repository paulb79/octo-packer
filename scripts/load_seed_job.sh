#!/usr/bin/env bash


export JENKINS_HOST=`hostname`
export JENKINS_USER=`cat /dev/random | LC_CTYPE=C tr -dc "[:alpha:]" | head -c 12; echo`
export JENKINS_API_KEY=`cat /dev/random | LC_CTYPE=C tr -dc "[:alpha:]" | head -c 12; echo`

cd ~/tmp
wget http://${JENKINS_HOST}:8080/jnlpJars/jenkins-cli.jar


pass=`sudo cat /var/lib/jenkins/secrets/initialAdminPassword` && echo "jenkins.model.Jenkins.instance.securityRealm.createAccount(\"$JENKINS_USER\", \"$JENKINS_API_KEY\")" | sudo java -jar jenkins-cli.jar -auth admin:$pass -s http://localhost:8080/ groovy =

git clone https://github.com/baber/jenkins-automation.git

cd jenkins-automation/
./gradlew loadSeed

cd ..

pass=`sudo cat /var/lib/jenkins/secrets/initialAdminPassword` && echo "hudson.model.User.get(\"$JENKINS_USER\").delete()" | sudo java -jar jenkins-cli.jar -auth admin:$pass -s http://localhost:8080/ groovy =



