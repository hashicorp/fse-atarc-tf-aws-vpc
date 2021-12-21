terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region     = var.region
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
  token      = var.AWS_SESSION_TOKEN

  default_tags {
    tags = {
      Owner       = "Daniel Fedick"
      Purpose     = "ATARC DEMO"
      Terraform   = "true"
      Environment = "development"
    }
  }

}
