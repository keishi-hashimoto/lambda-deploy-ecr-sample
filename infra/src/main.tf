terraform {
  required_version = ">=1"
  required_providers {
    aws = {
      version = ">=6"
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  default_tags {
    tags = {
      proj = local.proj
    }
  }
}

module "ecr" {
  source = "./modules/ecr"
  proj   = local.proj
}

module "lambda" {
  source         = "./modules/lambda"
  proj           = local.proj
  tag            = var.tag
  repository_url = module.ecr.repository_url
}