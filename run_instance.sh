#!/bin/bash

# Fetch instance's public IP
INSTANCE_IP=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)

# Replace localhost with instance's public IP in Dockerfile
sudo sed -i "s/localhost/${INSTANCE_IP}/" /home/ubuntu/rundeck/Dockerfile


