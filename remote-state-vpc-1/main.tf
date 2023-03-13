terraform {

  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      version = "= 4.56.0"
      source  = "hashicorp/aws"
    }
  }


  backend "s3" {
    bucket = "fermino-s3-remote-state"
    region = "us-east-1"
    key    = "aws-vpc/terraform.tfstate"
  }


}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      owner        = "fermino"
      managed-by   = "terraform"
      project-role = "demo"
    }
  }
}