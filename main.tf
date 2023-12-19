terraform {
required_providers {
    aws = {
    source  = "hashicorp/aws"
    version = "~> 5.0"
    }
}
}



provider "aws" {
region = "eu-west-2"
}


resource "aws_instance" "bereket-ec2" {
instance_type = "t2.micro"
key_name      = "proxy_key"
ami           = "ubuntu"


}

output "ipv4_address" {
value = aws_instance.bereket-ec2.key_name
}
