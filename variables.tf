variable "routes_count" { default = 1 }
variable "name" {
  type        = string
  description = "Name of Kubernetes cluster for tagging purposes"
}
variable "env_name" {
  type        = string
  description = "Name of environment for tagging purposes"
}
variable "vpc_id" {}
variable "subnet_ids" { type = list(any) }
variable "route_name" { type = list(any) }
variable "availability_zone" {
  type    = list(any)
  default = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}
variable "route_info" {
  description = "map of routing configuration "
  type = list(object({
    route_cidr                = string
    egress_only_gateway_id    = optional(string)
    gateway_id                = optional(string)
    instance_id               = optional(string)
    nat_gateway_id            = optional(string)
    network_interface_id      = optional(string)
    transit_gateway_id        = optional(string)
    vpc_peering_connection_id = optional(string)
  }))
  default = [null]
}

variable "extra_tags" {
  type    = map(any)
  default = {}
}