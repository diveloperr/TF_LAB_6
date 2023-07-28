variable "ecr_names" {
  type = map(string)
  default = {
    "shpark-ecr5" = "false"
    "shpark-ecr6" = "true"
    "shpark-ecr7" = "false"
    "shpark-ecr8" = "true"
  }
}

resource "aws_ecr_repository" "ecr" {
  for_each             = var.ecr_names
  name                 = each.key
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = each.value
  }
}

