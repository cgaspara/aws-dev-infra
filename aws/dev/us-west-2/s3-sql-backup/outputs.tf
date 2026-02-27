
output "bucket_name" {
 value       = aws_s3_bucket.my_lab_bucket.bucket
 description = "S3 bucket name created by Terraform"
}
