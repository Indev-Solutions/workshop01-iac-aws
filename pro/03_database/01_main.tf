terraform {
  backend "s3" {
    bucket = "brstworkshop1"
    key    = "rst/iac"
    region = "us-east-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.4.0"
    }
  }

  required_version = "~> 1.7"
}

provider "aws" {
  region = var.region
}
