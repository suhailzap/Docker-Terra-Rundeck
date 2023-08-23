resource "aws_instance" "example" {
  ami                    = "ami-04e601abe3e1a910f" #change with your ami
  instance_type          = "t2.medium"
  key_name               = "Rundeck-test"
  vpc_security_group_ids = ["${aws_security_group.secgroup-example.id}"]

  user_data = var.user_data_script

  associate_public_ip_address = true

  root_block_device {
    volume_size = 20
  }

  tags = {
    Name        = "Rundeck EC2 Deployment"
    Description = "Rundeck Terraform Deployment EC2 instance"
  }
}
