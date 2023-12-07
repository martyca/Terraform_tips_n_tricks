locals {
    env = "prod"
}


resource "null_resource" "my_resource" {
    count = 1
}

resource "null_resource" "my_other_resource" {
    count = local.env == "prod" ? 1 : 0
}




output "conditionals" {
    value = true ? "yep, thats true" : "no, thats false"
}