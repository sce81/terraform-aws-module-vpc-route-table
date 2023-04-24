data "aws_vpc" "main" {
  filter {
    name   = "tag:Name"
    values = ["${var.name}-*"]
  }
}

//data "aws_subnets" "main" {
//  filter {
//    name   = "vpc-id"
//    values = [data.aws_vpc.main.id]
//  }
//
//  filter {
//    name   = "tag:Name"
//    values = ["*-${var.subnet_name}-*"]
//  }
//}

locals {

  subnet_ids = tolist(var.subnet_ids)

  common_tags = tomap({
    Terraform = "true"
  })


}
