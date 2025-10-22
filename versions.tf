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
  aws_access_key = var.aws_access_key
  aws_secret_access_key = var.aws_secret_access_key

}
