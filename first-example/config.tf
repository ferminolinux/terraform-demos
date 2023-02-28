terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "4.56.0"
    }
  }
}

provider aws {
  region = "us-east-1"
  access_key = "${var.AWS_CREDENTIALS["AWS_ACCESS_KEY_ID"]}"
  secret_key = "${var.AWS_CREDENTIALS["AWS_SECRET_KEY"]}"
}