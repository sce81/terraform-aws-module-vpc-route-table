resource "aws_route_table" "main" {
    count                               = var.routes_count
    vpc_id                              = var.vpc_id

    tags = merge(
        local.common_tags, var.extra_tags,
        tomap({
            Name = "${var.name}-${var.env_name}-${element(var.route_name, count.index)}"
        })
    )
}

resource "aws_route" "main" {
 count                                  = length(var.route_info) 

 route_table_id                         = element(aws_route_table.main[*].id, count.index)
 destination_cidr_block                 = var.route_info[count.index].route_cidr
 egress_only_gateway_id                 = var.route_info[count.index].egress_only_gateway_id
 gateway_id                             = var.route_info[count.index].gateway_id
 instance_id                            = var.route_info[count.index].instance_id
 nat_gateway_id                         = var.route_info[count.index].nat_gateway_id
 network_interface_id                   = var.route_info[count.index].network_interface_id
 transit_gateway_id                     = var.route_info[count.index].transit_gateway_id
 vpc_peering_connection_id              = var.route_info[count.index].vpc_peering_connection_id
 
}
 

resource "aws_route_table_association" "main" {
    count                               = length(var.subnet_ids)

    subnet_id                           = element(var.subnet_ids, count.index)
    route_table_id                      = element(aws_route_table.main[*].id, count.index)
}