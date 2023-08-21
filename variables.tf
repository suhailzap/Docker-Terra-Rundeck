# CIDR block
variable "vpc_cidr_block" {
  description = "vpc variable"
  type        = string
  default     = "10.20.0.0/16"
}

# default AWS region
variable "region" {
  default = "eu-central-1"
}

# default availability zone
variable "zone_a" {
  default = "eu-central-1a"
}