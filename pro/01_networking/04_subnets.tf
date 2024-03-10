resource "aws_subnet" "my_public_subnet1" {
  vpc_id                  = aws_vpc.my_vpc1.id
  cidr_block              = var.public_subnet1_cidr
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "my_public_subnet1"
  }
}

resource "aws_subnet" "my_private_subnet1_lb" {
  vpc_id            = aws_vpc.my_vpc1.id
  cidr_block        = var.private_subnet1_lb_cidr
  availability_zone = "${var.region}b"

  tags = {
    Name                              = "my_private_subnet1_lb"
    "kubernetes.io/role/internal-elb" = 1
  }
}

resource "aws_subnet" "my_private_subnet1_eks" {
  vpc_id            = aws_vpc.my_vpc1.id
  cidr_block        = var.private_subnet1_eks_cidr
  availability_zone = "${var.region}c"

  tags = {
    Name = "my_private_subnet1_eks"
  }
}

resource "aws_subnet" "my_private_subnet2_eks" {
  vpc_id            = aws_vpc.my_vpc1.id
  cidr_block        = var.private_subnet2_eks_cidr
  availability_zone = "${var.region}a"

  tags = {
    Name = "my_private_subnet2_eks"
  }
}

resource "aws_subnet" "my_private_subnet1_rds" {
  vpc_id            = aws_vpc.my_vpc1.id
  cidr_block        = var.private_subnet1_rds_cidr
  availability_zone = "${var.region}b"

  tags = {
    Name = "my_private_subnet1_rds"
  }
}

resource "aws_subnet" "my_private_subnet2_rds" {
  vpc_id            = aws_vpc.my_vpc1.id
  cidr_block        = var.private_subnet2_rds_cidr
  availability_zone = "${var.region}c"

  tags = {
    Name = "my_private_subnet2_rds"
  }
}
