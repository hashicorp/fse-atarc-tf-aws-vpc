terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Owner       = "Daniel Fedick"
      Purpose     = "ATARC DEMO"
      Terraform   = "true"
      Environment = "development"
    }
  }
}

## Migrated workspace to remote backend with TFE hosted provider loging variables

#provider "aws" {
#  region     = var.region
#  access_key = var.access_key
#  secret_key = var.secret_key
#}
