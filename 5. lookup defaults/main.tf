locals {
  people = {
    person1 = { name = "John", age = 28 }
    person2 = { name = "Jane" }  # Age not provided
    person3 = { name = "Alice", age = 24 }
    person4 = { name = "Bob", age = 35 }
    person5 = { name = "Charlie", age = 40 }
  }
}


resource "null_resource" "person" {
  for_each = local.people

  triggers = {
    name = each.value.name
    age  = each.value.age
  }

  provisioner "local-exec" {
    command = "echo Name: ${each.value.name}, Age: ${lookup(each.value, "age", 30)}"
  }
}
