variable "instance_size" {
  type = string
  description = "The EC2 Instance Size To Create"
}

variable "instance_name" {
  type = string
  description = "User friendly displayname of the EC2"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-west-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0858ac11a712d8709"
  key_name      = "us_west_1_jakes"
  instance_type = var.instance_size
  vpc_security_group_ids = ["sg-0aa6b747f518ebad6"]
  associate_public_ip_address = false
  subnet_id = "subnet-9e7398f8"

  tags = {
    Name = var.instance_name
  }
}
