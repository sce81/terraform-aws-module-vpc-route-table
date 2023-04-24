data "aws_vpc" "main" {
  filter {
    name   = "tag:Name"
    values = ["${var.name}-*"]
  }
}

locals {


  common_tags = tomap({
    Terraform = "true"
  })


}
