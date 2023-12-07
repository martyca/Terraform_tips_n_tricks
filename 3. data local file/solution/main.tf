data "local_file" "rsa" { # get local rsa public key for temporary keypair
  filename = pathexpand("~/.ssh/id_rsa.pub")
}


output "public_key" {
    value = data.local_file.rsa.content
}