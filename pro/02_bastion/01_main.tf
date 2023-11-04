terraform {
  backend "s3" {
    bucket = "brstworkshop1"
    key    = "workshop1/iac/rst/pro/bastion"
    region = "us-east-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.24.0"
    }
  }

  required_version = "~> 1.6.0"
}

provider "aws" {
  region = var.region
}
