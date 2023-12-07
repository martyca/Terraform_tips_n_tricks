locals {
    cidr_block = "10.0.0.0/16"
}

resource "null_resource" "test" {
    count = 3
    triggers = {
        cidr = cidrsubnet(local.cidr_block, 8, count.index)
    }
}