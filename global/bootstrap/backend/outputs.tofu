output "s3_bucket_id" {
  description = "The ID of the S3 bucket used to store OpenTofu remote state files."
  value       = aws_s3_bucket.main.id
}

output "s3_bucket_arn" {
  description = "The ARN of the S3 state bucket for IAM policy configurations."
  value       = aws_s3_bucket.main.arn
}