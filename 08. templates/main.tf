provider "template" {}

data "template_file" "html" {
  template = file("${path.module}/template.tpl")

  vars = {
    title   = "My Web Page"
    heading = "Welcome to My Web Page"
    message = "This is a web page created from a template."
  }
}

output "rendered_html" {
  value = data.template_file.html.rendered
}
