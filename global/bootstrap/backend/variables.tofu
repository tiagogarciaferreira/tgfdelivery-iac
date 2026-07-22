variable "aws_region" {
  description = "The AWS region to deploy resources."
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "The name of the S3 state bucket."
  type        = string
  default     = "tgfdelivery-tfstate"
}

variable "force_destroy" {
  description = "Whether to force destroy the bucket on deletion."
  type        = bool
  default     = false
}