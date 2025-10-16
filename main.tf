terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  # Do NOT set a backend here when using a VCS-driven Terraform Cloud workspace;
  # the workspace manages the remote state/backends.
}

provider "aws" {
  region = var.aws_region
assume_role {
    role_arn     = "arn:aws:iam::573636634543:role/TerraformCloudRole"
    session_name = "terraform-cloud"
  }
}

resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  tags = merge(var.tags, { ManagedBy = "TerraformCloud" })
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

output "bucket_name" {
  value = aws_s3_bucket.this.bucket
}
