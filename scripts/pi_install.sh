#!/bin/bash
############################################################
# script to install docker and some tools at RaspberryPi 2 #
############################################################

#update and upgrade packages
sudo apt-get -y update && sudo apt-get -y upgrade

configure_docker{
	#install docker
	curl -sSL https://get.docker.com | sh 
	
	# set permission to docker
	sudo usermod -aG docker $USER
}

configure_user{
	#create user != root
	sudo useradd admin -p admin
	
	#adding to sudoers group
	sudo usermod -aG admin sudoers
}

main {
   echo "Configuring user"
   configure_user
   
   echo "Installing and configuring docker"
   configure_docker
    
   echo "done!"	
   
}

main
