output "my_public_subnet1_id" {
  value = aws_subnet.my_public_subnet1.id
}

output "my_private_subnet1_lb_id" {
  value = aws_subnet.my_private_subnet1_lb.id
}

output "my_private_subnet1_eks_id" {
  value = aws_subnet.my_private_subnet1_eks.id
}

output "my_private_subnet2_eks_id" {
  value = aws_subnet.my_private_subnet2_eks.id
}

output "my_private_subnet1_rds_id" {
  value = aws_subnet.my_private_subnet1_rds.id
}

output "my_private_subnet2_rds_id" {
  value = aws_subnet.my_private_subnet2_rds.id
}

output "my_vpc1_default_security_group_id" {
  value = aws_vpc.my_vpc1.default_security_group_id
}
