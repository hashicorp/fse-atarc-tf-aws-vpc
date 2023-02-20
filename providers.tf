# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.region


  default_tags {
    tags = {
      Owner       = "Daniel Fedick"
      Purpose     = "ATARC DEMO"
      Terraform   = true
      Environment = "development"
      DoNotDelete = false
    }
  }

}
