require 'aws-sdk'
require 'date'

desc 'Create the Jenkins AMI using packer'
task :create_jenkins_ami do
  sh 'cd jenkins-ami && \
    packer build create_jenkins.json'
  end

