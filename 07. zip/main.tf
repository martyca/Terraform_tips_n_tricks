provider "archive" {}

data "archive_file" "moby_dick_zip" {
  type        = "zip"
  source_file = "${path.module}/source/moby_dick.txt"
  output_path = "${path.module}/archive/moby_dick.zip"
}
