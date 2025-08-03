variable "aws_region" {
  default = "ap-south-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami_id" {
  description = "AMI for EC2"
}

variable "key_name" {}

variable "public_key_path" {}
