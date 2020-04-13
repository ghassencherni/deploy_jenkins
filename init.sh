#!/bin/bash 

################################################################################
#Script Name	:init.sh                                                       #                                       
#Description	:Allows to build and configure the jenkins instance on AWS     #
#Author       	:Ghassen CHARNI                                                # 
#Email         	:ghassen.cherni@gmail.com                                      #
#Client         :Artifakt (DevOps Assesment Test)                              #
################################################################################


###### Deploying the Jenkins EC2 instance

terraform plan -out=tfplan -input=false

terraform apply -lock=false -input=false tfplan



###### Configuring Jenkins with Ansible

# Sleep until full starting the instance
sleep 30
echo "waiting for SSHD daemon"

# To avoid host key checking during running install
export ANSIBLE_HOST_KEY_CHECKING=False

ansible-playbook deploy_jenkins.yml -i hosts.ini -v -u ec2-user
