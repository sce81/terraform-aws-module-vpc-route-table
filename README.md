# Terraform Module for AWS Route Table entry


## Getting Started

This module is intended to populate route tables in AWS

Resources
- aws_route_table
- aws_route[var.routes_count * length(var.route_cidr)]
- aws_route_table_association[length(var.subnet_ids)]


### Prerequisites

Terraform ~> 1.0.0

### Tested

Terraform ~> 1.0.0
### Installing

This module should be called by a terraform environment configuration via github
```  
      source           = "git@github.com:sce81/terraform-module-aws-route-table.git"
```
or Terraform Cloud
```
      source           = "app.terraform.io/HashiCorp_AWS_Org/terraform-module-aws-route-table/module"
      version          = "1.0.0"
```

### Usage

This module has a number of mandatory variables it expects to be passed into it.  

```
env
vpc_id
subnet_ids[]
route_name[]
````
This module also requires a minimum of 1 of the interfaces listed below.
each must have a corresponding route_cidr associated with it and route_cidrs may not overlap.  

```
egress_only_gateway_id
gateway_id
instance_id
nat_gateway_id
network_interface_id
transit_gateway_id
vpc_peering_connection_id
````

addional tags can be appended using the following map

```
extra_tags
```

the remaining variables are configured with sane defaults which can be overwritten by the parent.  


### Outputs

The following values are outputted

- aws_route_table.main[*].id


<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [aws_route.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route_table.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | n/a | `list(any)` | <pre>[<br/>  "eu-west-1a",<br/>  "eu-west-1b",<br/>  "eu-west-1c"<br/>]</pre> | no |
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | n/a | `map(any)` | `{}` | no |
| <a name="input_route_info"></a> [route\_info](#input\_route\_info) | map of routing configuration | <pre>list(object({<br/>    route_cidr                = string<br/>    egress_only_gateway_id    = optional(string)<br/>    gateway_id                = optional(string)<br/>    instance_id               = optional(string)<br/>    nat_gateway_id            = optional(string)<br/>    network_interface_id      = optional(string)<br/>    transit_gateway_id        = optional(string)<br/>    vpc_peering_connection_id = optional(string)<br/>  }))</pre> | <pre>[<br/>  null<br/>]</pre> | no |
| <a name="input_route_name"></a> [route\_name](#input\_route\_name) | n/a | `list(any)` | n/a | yes |
| <a name="input_routes_count"></a> [routes\_count](#input\_routes\_count) | n/a | `number` | `1` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | n/a | `list(any)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_route_table"></a> [route\_table](#output\_route\_table) | n/a |
<!-- END_TF_DOCS -->
