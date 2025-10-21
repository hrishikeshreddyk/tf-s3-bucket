terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.5.0"
}

provider "aws" {
  region = "us-east-1"   # Change this to your preferred AWS region
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-s3-bucket-name-12345"  # Must be globally unique
  acl    = "private"  # Access control: private | public-read | etc.

  tags = {
    Name        = "MyS3Bucket"
    Environment = "Dev"
  }
}
