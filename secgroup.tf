# AWS Security Group
resource "aws_security_group" "secgroup-example" {
  name        = "secgroup-example"
  description = "Security Group for Rundeck Terraform Deployment Example"
  vpc_id      = "vpc-0eae937cb9e36f396" #change with your vpc id 
  tags = {
    Name = "Rundeck Terraform Deployment Example Security Group"
  }
}

# Rundeck (port 4440 by default)
resource "aws_security_group_rule" "rundeck" {
  type              = "ingress"
  description       = "rundeck"
  from_port         = 4440
  to_port           = 4440
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.secgroup-example.id
}

# MariaDB (port 3306)
resource "aws_security_group_rule" "mariadb" {
  type              = "ingress"
  description       = "mariadb"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"] # Open to all sources, consider restricting this
  security_group_id = aws_security_group.secgroup-example.id
}

# SSH service (port 22)
resource "aws_security_group_rule" "ssh" {
  type              = "ingress"
  description       = "ssh"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.secgroup-example.id
}

# outcoming rule to "all", only for testing, the aim is to restrict the access to some "allowed" clients.
resource "aws_security_group_rule" "all" {
  type              = "egress"
  description       = "all"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.secgroup-example.id
}
