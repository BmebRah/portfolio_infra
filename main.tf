terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~>5.0"
        }
    }
  }

provider "aws" {
  region = "eu-west-2"
}

resource "aws_ecr_repository" "backend" {
  name                 = "portfolio-aws-backend"
  image_tag_mutability = "MUTABLE"

}




