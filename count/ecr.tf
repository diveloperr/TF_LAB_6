
variable "ecr_names" {
  type = list(any)
  default = ["shpark-ecr1", "shpark-ecr2",
  "shpark-ecr3", "shpark-ecr4"]
}


resource "aws_ecr_repository" "ecr" {
  count                = length(var.ecr_names)
  name                 = element(var.ecr_names, count.index)
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = "false"
  }
}


