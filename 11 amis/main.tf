resource "aws_launch_template" "webserver" {
  name_prefix   = "demo-"
  image_id      = "ami-0361bbf2b99f46c1d"
  instance_type = "t3.nano"
  lifecycle {
    create_before_destroy = true
  }
}