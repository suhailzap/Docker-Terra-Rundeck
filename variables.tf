# CIDR block
variable "vpc_cidr_block" {
  description = "vpc variable"
  type        = string
  default     = "10.20.0.0/16"
}
#optional
# default AWS region
variable "region" {
  default = "eu-central-1"
}

# default availability zone
variable "zone_a" {
  default = "eu-central-1a"
}

# installing and configuring
variable "user_data_script" {
  default = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y docker.io
    sudo apt-get install -y curl
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    # Create Docker network
    sudo docker network create mynet
    cd /home/ubuntu/
    sudo git clone https://github.com/suhailzap/Docker-Terra-Rundeck.git
    cd /home/ubuntu/Docker-Terra-Rundeck
    sudo docker-compose up -d
    sudo docker exec mydb mysql:5.7 -u root -p root -e "create database rundeck; grant all privileges on *.* to 'rundeck'@'%';"
    EOF
}
