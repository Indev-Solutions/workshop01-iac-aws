output "my_subnet1_id" {
  value = aws_subnet.my_subnet1.id
}

output "my_vpc1_default_security_group_id" {
  value = aws_vpc.my_vpc1.default_security_group_id
}
