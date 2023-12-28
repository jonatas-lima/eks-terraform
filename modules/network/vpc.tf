data "aws_availability_zones" "azs" {
  state = "available"
}

resource "aws_vpc" "default" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "default-VPC"
  }
}

