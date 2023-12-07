

resource "null_resource" "my_ec2" {
  triggers = {
    user_data = base64encode(<<-EOF
        #!/bin/bash
        yum update -y
        yum install httpd -y
        echo "<h1>${HOSTNAME}</h1>" > /var/www/html/index.html
        systemctl enable httpd
        systemctl start httpd
        EOF
    )
  }
}

output "user_data" {
  value = resource.null_resource.my_ec2
}