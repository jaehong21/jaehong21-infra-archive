# Configure the AWS Provider
provider "aws" {
  # aws-cli profile
  profile = "jaehong21"
  region = "ap-northeast-2"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.65"
    }
  }
  backend s3 {
    # S3 bucket name of .tfstate
    bucket         = "jaehong21-tfstate"
    # tfstate path in S3
    key            = "terraform.tfstate"
    region         = "ap-northeast-2"
    # name of dynamodb_table
    dynamodb_table = "tfstate-lock"
    # aws-cli profile
    profile        = "jaehong21"
  }
}
