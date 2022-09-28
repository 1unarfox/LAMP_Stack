terraform {
  required_version = ">= 0.13.1"
  backend "s3" {
        region = "us-east-1"
        profile = "default"
        key = "terraformstatefile"
        bucket = "tf-state-poc-storage"
    }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.73"
    }
  }
}

provider "aws" {
  region  = var.region
}