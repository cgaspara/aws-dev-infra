provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "my_lab_bucket" {
  bucket = "craigs-terraform-lab-bucket"
  force_destroy = true
  tags = {
    Name        = "My Lab Bucket"
    Environment = "Dev"
  }
}
