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

This module should be called by a terraform environment configuration
```  
    source  =   "git@github.com:sce81/terraform-module-aws-route-table.git"
```

### Usage

This module has a number of mandatory variables it expects to be passed into it.  

```
env
vpc_id
subnet_ids[]
route_name[]
````
This module also requires a minimum of 1 of.
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

