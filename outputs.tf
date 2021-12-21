output "aws_vpn_gateway_id" {
  description = "The ID of the VPN Gateway"
  value       = module.vpc.vgw_id
}

output "private_subnet_ids" {
  value = module.vpc.private_subnets
}

output "public_subnet_ids" {
  value = module.vpc.public_subnets
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

