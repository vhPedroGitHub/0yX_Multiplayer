terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket         = "terraform-state-alivi-vision"
    key            = "infra_manual/environments/dev/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform_lock"
  }

}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}