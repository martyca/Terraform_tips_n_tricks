locals {
    count = 20
}

resource "random_pet" "mypet" {
    count = local.count
}

resource "null_resource" "pet" {
    count = local.count
    triggers = {
        name = random_pet.mypet[count.index].id
    }
}

output "null_resources" {
    value = null_resource.pet.*.triggers.name
}