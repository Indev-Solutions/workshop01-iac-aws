output "database_password" {
  value       = random_string.database_password.result
  sensitive   = true
}

output "database_hostname" {
  value       = aws_db_instance.my_db_instance.address
  sensitive   = true
}
