resource "null_resource" "first_batch" {
    count = 3
    triggers = {
        name = "first_batch ${count.index}"
    }
}


resource "null_resource" "second_batch" {
    count = 3
    triggers = {
        name = "second_batch ${count.index}"
    }
}


resource "null_resource" "third_batch" {
    count = 3
    triggers = {
        name = "third_batch ${count.index}"
    }
}




output "first_batch" {
    value = null_resource.first_batch.*.triggers.name
}

output "second_batch" {
    value = null_resource.second_batch.*.triggers.name
}

output "third_batch" {
    value = null_resource.third_batch.*.triggers.name
}


