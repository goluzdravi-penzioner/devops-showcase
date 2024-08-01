resource "aws_ecr_repository" "testapp" {
  name                 = "testapp"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}