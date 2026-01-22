provider "aws" {
 region                  = "us-east-1"
 access_key              = var.AWS_ACCESS_KEY_ID
 secret_key              = var.AWS_SECRET_ACCESS_KEY
}

resource "aws_s3_bucket" "sql_backup" {
  bucket = "mssql-backup-${random_id.bucket_suffix.hex}"
  force_destroy = true

  tags = {
    Name        = "mssql-backup"
    Environment = "dev"
    Owner       = "cgaspara"
  }
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.sql_backup.id

  versioning_configuration {
    status = "Enabled"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.sql_backup.bucket
}

