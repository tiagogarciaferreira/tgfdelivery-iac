terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.54.0"
    }
  }

  // adicionar depois o backend com s3
}

provider "aws" {
  region = var.aws_region
}