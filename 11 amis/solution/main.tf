provider "aws" {
  region = "ap-southeast-2"
}

data "aws_ami" "amzlinux" { # get amazon linux ami for current region
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-2023*-x86_64"] # amazon linux 2023
    # values = ["amzn2-ami-kernel-5.10*-x86_64-gp2"] # amazon linux 2
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}


output "ami" {
    value = data.aws_ami.amzlinux.id
}