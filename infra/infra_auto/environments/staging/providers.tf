terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket  = "terraform-state-alivi-vision"
    key     = "infra_auto/environments/staging/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }

}

## Configure the AWS Provider
provider "aws" {
  region = var.region
  assume_role {
    role_arn = var.deploy_account_role_arn
  }
}

data "aws_caller_identity" "current" {}