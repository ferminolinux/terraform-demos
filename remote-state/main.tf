terraform {

    required_version = ">= 1.3.0"

    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "= 4.56.0"
      }
    }
}


provider "aws" {
    region = "us-east-1"

    default_tags {
      tags = {
        owner = "fermino"
        managed-by = "terraform"
        project-role = "demo"
      }
    }
}