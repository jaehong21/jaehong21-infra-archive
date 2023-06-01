# Configure the AWS Provider
provider "aws" {
  # aws-cli profile
  profile = "jaehong21"
  region  = "ap-northeast-2"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.65"
    }
  }
  backend "s3" {
    # S3 bucket name of .tfstate
    bucket = "jaehong21-tfstate"
    # tfstate path in S3
    key    = "terraform.tfstate"
    region = "ap-northeast-2"
    # name of dynamodb_table
    dynamodb_table = "tfstate-lock"
    # aws-cli profile
    profile = "jaehong21"
  }
}

resource "aws_s3_bucket" "tfstate-bucket" {
  bucket = "jaehong21-tfstate"
}

resource "aws_s3_bucket_versioning" "tfstate-versioning" {
  bucket = aws_s3_bucket.tfstate-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform_state_lock" {
  name         = "tfstate-lock"
  hash_key     = "LockID"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }
}
