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
  assume_role {
    role_arn = "arn:aws:iam::573636634543:role/terraform_role"
}

}
