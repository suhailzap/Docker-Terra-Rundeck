# the EC2 instance details
resource "aws_instance" "example" {
  ami                    = "ami-04e601abe3e1a910f" #chenge with your ami
  instance_type          = "t2.medium"
  key_name               = "Rundeck-test"
  vpc_security_group_ids = ["${aws_security_group.secgroup-example.id}"]


  user_data                   = <<-EOF
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
  associate_public_ip_address = true

  # 10gb disk instance
  root_block_device {
    volume_size = 20
  }

  # EC2 instance tags
  tags = {
    Name        = "Rundeck EC2 Deployment"
    Description = "Rundeck Terraform Deployment EC2 instance"
  }
}

