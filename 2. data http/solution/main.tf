#data "http" "ip" { # get local IP for security groups
#  url = "https://api.ipify.org?format=json"
#  request_headers = {
#    Accept = "application/json"
#  }
#}

data "http" "kanye" {
  url = "https://api.kanye.rest/"
}


output "kanye" {
  #value = data.http.kanye
  value = jsondecode(data.http.kanye.response_body).quote

}

#output "myip" {
#    value = jsondecode(data.http.ip.response_body).ip
#}


