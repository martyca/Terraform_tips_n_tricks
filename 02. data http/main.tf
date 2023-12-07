locals {
  ip = 123.234.123.234
}

data "aws_vpc" "selected" {
  id = "vpc-00e22c4bb0a8f3e86"
}



resource "aws_security_group" "demo" {
  name        = "demo"
  description = "Allow all from Local IP"
  vpc_id      = "vpc-00e22c4bb0a8f3e86"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["${local.ip}/32"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "demo"
  }
}
