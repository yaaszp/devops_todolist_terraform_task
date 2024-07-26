#!/bin/bash

# Script to silently install and start the todo web app on the virtual machine. 
# Note that all commands bellow are without sudo - that's because extention mechanism 
# runs scripts under root user. 

# install system updates and isntall python3-pip package using apt. '-yq' flags are 
# used to suppress any interactive prompts - we won't be able to confirm operation 
# when running the script as VM extention.  
sudo apt-get update -yq
sudo apt-get install python3-pip -yq

# Create a directory for the app and download the files. 
sudo mkdir /app
# make sure to uncomment the line bellow and update the link with your GitHub username
https://github.com/yaaszp/devops_todolist_terraform_task.git
sudo cp -r devops_todolist_terraform_task/app/* /app

# create a service for the app via systemctl and start the app
sudo mv /app/todoapp.service /etc/systemd/system/
sudo chmod 777 /app/start.sh
sudo systemctl daemon-reload
sodo systemctl start todoapp
sudo systemctl enable todoapp
