resource "aws_subnet" "my_subnet1" {
  vpc_id                  = aws_vpc.my_vpc1.id
  cidr_block              = var.subnet1_cidr
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "my_subnet1"
  }
}

resource "aws_subnet" "my_subnet2" {
  vpc_id            = aws_vpc.my_vpc1.id
  cidr_block        = var.subnet2_cidr
  availability_zone = "${var.region}b"

  tags = {
    Name                              = "my_subnet2"
    "kubernetes.io/role/internal-elb" = 1
  }
}

resource "aws_subnet" "my_subnet3" {
  vpc_id            = aws_vpc.my_vpc1.id
  cidr_block        = var.subnet3_cidr
  availability_zone = "${var.region}c"

  tags = {
    Name = "my_subnet3"
  }
}

resource "aws_subnet" "my_subnet4" {
  vpc_id            = aws_vpc.my_vpc1.id
  cidr_block        = var.subnet4_cidr
  availability_zone = "${var.region}a"

  tags = {
    Name = "my_subnet4"
  }
}

resource "aws_subnet" "my_subnet5" {
  vpc_id            = aws_vpc.my_vpc1.id
  cidr_block        = var.subnet5_cidr
  availability_zone = "${var.region}c"

  tags = {
    Name = "my_subnet5"
  }
}

resource "aws_subnet" "my_subnet6" {
  vpc_id            = aws_vpc.my_vpc1.id
  cidr_block        = var.subnet6_cidr
  availability_zone = "${var.region}a"

  tags = {
    Name = "my_subnet6"
  }
}

resource "aws_subnet" "my_subnet7" {
  vpc_id            = aws_vpc.my_vpc1.id
  cidr_block        = var.subnet7_cidr
  availability_zone = "${var.region}b"

  tags = {
    Name = "my_subnet7"
  }
}

resource "aws_subnet" "my_subnet8" {
  vpc_id            = aws_vpc.my_vpc1.id
  cidr_block        = var.subnet8_cidr
  availability_zone = "${var.region}c"

  tags = {
    Name = "my_subnet8"
  }
}
