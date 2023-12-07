locals {
  cidr_block    = "10.0.0.0/16"
}

data "aws_region" "current" {} # need region for vpc endpoint

resource "aws_vpc" "demo" {
  cidr_block           = local.cidr_block
  enable_dns_hostnames = true

  tags = {
    Name = "demo"
  }
}

resource "aws_subnet" "mysubnet" {
  vpc_id            = aws_vpc.demo.id
  cidr_block        = cidrsubnet(local.cidr_block, 8, 0)
  tags = {
    Name = "demo-mysubnet"
  }
}

resource "aws_internet_gateway" "demo" {
  vpc_id = aws_vpc.demo.id

  tags = {
    Name = "demo"
  }
}

resource "aws_route_table" "demo" {
  vpc_id = aws_vpc.demo.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo.id
  }

  tags = {
    Name = "demo"
  }
}

resource "aws_route_table_association" "demo_public" {
  subnet_id      = aws_subnet.mysubnet.id
  route_table_id = aws_route_table.demo.id
}
