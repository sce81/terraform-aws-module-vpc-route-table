output "route_table" {
    value = aws_route_table.main[*].id
}