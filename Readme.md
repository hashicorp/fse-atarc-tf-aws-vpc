---
title: AWS VPC
tags: aws vpc
---

# aws-vpc
This code is written for a demo Instruqt course hwoever it can be utilized for creating an AWS VPC.

### main.tf 
The [aws-vpc module](https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest) can be used to quickly setup an AWS VPC. With a few variables passed in, a new VPC with associated priv/public subnets availability-zones can be created. 

```hcl tangle:./main.tf
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "zt-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["${var.region}a", "${var.region}b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "development"
  }
}
```

### backend.tf 
The backend file is to specify the location and name of the state file.
Below we are storing state in the local current directory
The statefile will not be created until a `terraform init` is run. 

```hcl tangle:./backend.tf
terraform {
  required_version = "~> 1.0.11"
  backend "local" {
    path = "./terraform.tfstate"
  }
}
```

### providers.tf
The [provider file](https://registry.terraform.io/providers/hashicorp/aws/latest/docs) is what Terraform Core interacts with in order to bring in different providers like AWS, Azure etc. In the following provider we are using the [AWS provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc).  To interact with the provider for AWS, we will need credentials and region. 

```hcl tangle:./providers.tf
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
  access_key = var.access_key
  secret_key = var.secret_key
}
```

### File: variables.tf

```hcl tangle:./variables.tf
variable "region" { 
  type    = string
  description = "AWS Region"
  default = "us-east-2"
}
variable "access_key" { 
  type    = string
  description = "This is the value of AWS_ACCESS_KEY_ID"
  default = "x---"
}

variable "secret_key" { 
  type    = string
  description = "This is the value of AWS_SECRET_ACCESS_KEY"
  default = "x---"
  sensitive = true
}
```
### File: outputs.tf

The following creates an output for the VPN Gateway 

```hcl tangle:./outputs.tf
output "aws_vpn_gateway_id" {
  description = "The ID of the VPN Gateway"
  value       = module.vpc.vgw_id
}
```