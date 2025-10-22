
resource "aws_s3_bucket" "my_bucket" {
  bucket = "hrishikesh-terraform-bucket-2025-10-22"  # Must be globally unique
  acl    = "private"  # Access control: private | public-read | etc.

  tags = {
    Name        = "MyS3Bucket"
    Environment = "Dev"
  }
}
