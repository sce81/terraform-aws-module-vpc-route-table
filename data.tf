locals {
  common_tags = tomap({
    Terraform = "true"
  })

}

data "aws_vpc" "main" {
  id = var.vpc_id
}

