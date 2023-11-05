resource "aws_db_subnet_group" "my_db_subnet_group" {
  name       = "my_db_subnet_group"
  subnet_ids = [data.terraform_remote_state.networking.outputs.my_subnet7_id, data.terraform_remote_state.networking.outputs.my_subnet8_id]

  tags = {
    Name = "my_db_subnet_group"
  }
}

resource "random_string" "database_password" {
  length           = 12
  special          = true
  override_special = "@$"
}

resource "aws_db_instance" "my_db_instance" {
  allocated_storage      = 20
  db_name                = "workshop"
  engine                 = "postgres"
  engine_version         = "15.3"
  instance_class         = "db.t3.micro"
  username               = "dbadmin"
  password               = random_string.database_password.result
  network_type           = "IPV4"
  storage_type           = "gp2"
  identifier_prefix      = "workshop-"
  db_subnet_group_name   = aws_db_subnet_group.my_db_subnet_group.name
  vpc_security_group_ids = [data.terraform_remote_state.networking.outputs.my_vpc1_default_security_group_id]
  skip_final_snapshot    = true

  tags = {
    Name = "my_db_instance"
  }
}
