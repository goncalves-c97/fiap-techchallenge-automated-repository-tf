terraform {
  backend "s3" {
    bucket = "fiap-techchallenge-terraform-states"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "this" {
  bucket = "fiap-techchallenge-automated-bucket-tf-v2"

  tags = {
    Name        = "Tag name por Pull Request"
    Environment = "Dev"
  }
}
