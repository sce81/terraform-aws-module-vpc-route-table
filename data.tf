data "aws_vpc" "main" {
  filter {
    name   = "tag:Name"
    values = ["${var.name}-${var.env_name}-vpc"]
  }
}

locals {


  common_tags = tomap({
    Terraform = "true"
  })


}
