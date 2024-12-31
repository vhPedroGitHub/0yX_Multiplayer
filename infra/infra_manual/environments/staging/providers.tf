terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket  = "terraform-state-alivi-vision"
    key     = "infra_manual/environments/staging/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }

}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}