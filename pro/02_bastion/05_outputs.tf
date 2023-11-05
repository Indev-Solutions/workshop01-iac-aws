output "bastion_public_ip" {
  value = aws_instance.my_instance1.public_ip
}

output "bastion_private_ip" {
  value = aws_instance.my_instance1.private_ip
}
