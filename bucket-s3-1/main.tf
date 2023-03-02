terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 4.56.0"
    }
  }

}


provider "aws" {
  region     = "us-east-1"
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_KEY
  default_tags {
    tags = {
      owner      = "fermino"
      managed-by = "terraform"
    }
  }
}