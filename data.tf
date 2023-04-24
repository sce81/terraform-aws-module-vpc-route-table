data "aws_vpc" "main" {
  filter {
    name   = "tag:Name"
    values = ["${var.name}-*"]
  }
}

data "aws_subnets" "main" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.main.id]
  }

  filter {
    name   = "tag:Name"
    values = ["*-${var.subnet_name}-*"]
  }
}

data "aws_subnet" "main" {
  for_each = data.aws_subnets.main.ids
  id       = each.value
}

locals {

  subnet_ids = tolist(data.aws_subnet.main.ids)

  common_tags = tomap({
    Terraform = "true"
  })


}
