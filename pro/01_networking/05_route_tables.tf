resource "aws_route_table" "my_rt1" {
  vpc_id = aws_vpc.my_vpc1.id

  tags = {
    Name = "my_rt1"
  }
}

resource "aws_route" "my_route1" {
  route_table_id         = aws_route_table.my_rt1.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.my_ig1.id
}

resource "aws_route_table_association" "my_rta1" {
  subnet_id      = aws_subnet.my_public_subnet1.id
  route_table_id = aws_route_table.my_rt1.id
}

resource "aws_route_table" "my_rt2" {
  vpc_id = aws_vpc.my_vpc1.id

  tags = {
    Name = "my_rt2"
  }
}

resource "aws_route" "my_route2" {
  route_table_id         = aws_route_table.my_rt2.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.my_natg1.id
}

resource "aws_route_table_association" "my_rta2" {
  subnet_id      = aws_subnet.my_private_subnet1_eks.id
  route_table_id = aws_route_table.my_rt2.id
}

resource "aws_route_table_association" "my_rta3" {
  subnet_id      = aws_subnet.my_private_subnet2_eks.id
  route_table_id = aws_route_table.my_rt2.id
}

resource "aws_route_table" "my_rt3" {
  vpc_id = aws_vpc.my_vpc1.id

  tags = {
    Name = "my_rt3"
  }
}

resource "aws_route_table_association" "my_rta4" {
  subnet_id      = aws_subnet.my_private_subnet1_lb.id
  route_table_id = aws_route_table.my_rt3.id
}

resource "aws_route_table_association" "my_rta5" {
  subnet_id      = aws_subnet.my_private_subnet1_rds.id
  route_table_id = aws_route_table.my_rt3.id
}

resource "aws_route_table_association" "my_rta6" {
  subnet_id      = aws_subnet.my_private_subnet2_rds.id
  route_table_id = aws_route_table.my_rt3.id
}
