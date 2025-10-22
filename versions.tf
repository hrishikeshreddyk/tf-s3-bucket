terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.47.0"
    }
  }

  required_version = ">= 1.3.0"
}

provider "aws" {
  region = "us-west-2"   # Change this to your preferred AWS region
  assume_role {
    role_arn = "arn:aws:iam::573636634543:role/terraform_role"
}

}
