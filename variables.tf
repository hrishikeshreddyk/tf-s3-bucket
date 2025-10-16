variable "bucket_name" {
  description = "Unique S3 bucket name"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "tags" {
  description = "Map of tags"
  type        = map(string)
  default     = {}
}
