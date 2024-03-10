resource "aws_vpc" "my_vpc1" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = "my_vpc1"
  }
}

resource "aws_internet_gateway" "my_ig1" {
  vpc_id = aws_vpc.my_vpc1.id

  tags = {
    Name = "my_ig1"
  }
}

resource "aws_eip" "my_eip1" {
  domain = "vpc"

  tags = {
    Name = "my_eip1"
  }
}

resource "aws_nat_gateway" "my_natg1" {
  allocation_id = aws_eip.my_eip1.id
  subnet_id     = aws_subnet.my_public_subnet1.id

  tags = {
    Name = "my_natg1"
  }
}
