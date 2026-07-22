terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.54.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.6.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.3.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.9.0"
    }
  }

  # backend "s3" {
  #   bucket = "tgfdelivery-tfstate"
  #   key    = "tgfdelivery/${var.environment}/remote.tfstate"
  #   region = var.aws_region

  #   use_lockfile = true
  #   lock_tags = {
  #     "object:type" : "lock"
  #   }

  #   state_tags = local.common_tags
  # }
}

provider "aws" {
  region = var.aws_region
}