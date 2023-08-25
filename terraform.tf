# default Terraform provider: AWS
provider "aws" {
  profile = "default"
  region  = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  default_tags {
    tags = {
      env = "example",
    }
  }
}

# Terraform requisites
terraform {
  required_version = ">=1.1.8"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.11.0"
    }
  }
}
