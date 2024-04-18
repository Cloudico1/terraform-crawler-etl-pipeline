terraform {
    backend "s3" {
        bucket = "project-dev-terraform-state"
        key    = "terraform.tfstate"
        region     = "us-east-2"
        # dynamodb_table  = "terraform_locks"
    }
    required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=4.36.0"
    }
  }
}

provider "aws" {
    alias = "primary"
    region = "us-east-2"
    profile = "project-dev"
}

