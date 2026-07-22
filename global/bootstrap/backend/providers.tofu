terraform {
  required_version = "~> 1.12.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.54.0"
    }
  }

  # Validara a criptografia do arquivo state
  backend "s3" {
    bucket       = var.bucket_name
    key          = "${local.context_name}/${local.environment}/remote.tfstate"
    region       = var.aws_region
    use_lockfile = true

    lock_tags = {
      "object:type" : "lock"
    }

    state_tags = local.common_tags
  }
}

provider "aws" {
  region = var.aws_region
}