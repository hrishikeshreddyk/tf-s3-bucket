
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-s3-bucket-name-12345"  # Must be globally unique
  acl    = "private"  # Access control: private | public-read | etc.

  tags = {
    Name        = "MyS3Bucket"
    Environment = "Dev"
  }
}
