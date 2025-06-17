resource "aws_ecr_repository" "image_processor" {
  name                 = var.repository_name
  image_tag_mutability = "MUTABLE"
  scan_on_push         = true
}