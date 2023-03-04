terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      version = "= 4.56.0"
      source  = "hashicorp/aws"
    }
  }
}


provider "aws" {
  # use enviroment variables for credentials
  region = "us-east-1"
  default_tags {
    tags = {
      owner      = "fermino"
      managed-by = "terraform"
    }
  }
}