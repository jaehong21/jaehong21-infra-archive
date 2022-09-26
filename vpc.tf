resource "aws_vpc" "default_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "terraform_vpc"
  }
}

resource "aws_subnet" "first_public_subnet" {
  vpc_id     = aws_vpc.default_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "terraform_subnet_a"
  }
}
resource "aws_subnet" "second_public_subnet" {
  vpc_id     = aws_vpc.default_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-northeast-2b"
  tags = {
    Name = "terraform_subnet_b"
  }
}
resource "aws_subnet" "first_private_subnet" {
  vpc_id     = aws_vpc.default_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "terraform_subnet_c"
  }
}
resource "aws_subnet" "second_private_subnet" {
  vpc_id     = aws_vpc.default_vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "ap-northeast-2b"
  tags = {
    Name = "terraform_subnet_d"
  }
}

resource "aws_internet_gateway" "default_igw" {
  vpc_id = aws_vpc.default_vpc.id
  tags = {
    Name = "terraform_igw"
  }
}
resource "aws_route_table" "default_route_table" {
  vpc_id = aws_vpc.default_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.default_igw.id
  }
  tags = {
    Name = "terraform_route_table"
  }
}
resource "aws_route_table_association" "first_subnet_association" {
  subnet_id      = aws_subnet.first_public_subnet.id
  route_table_id = aws_route_table.default_route_table.id
}
resource "aws_route_table_association" "second_subnet_association" {
  subnet_id      = aws_subnet.second_public_subnet.id
  route_table_id = aws_route_table.default_route_table.id
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.default_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    network_interface_id = var.aws_instance.nat_instance.id
    # instance_id = aws_instance.nat_instance.id
  }
  tags = {
    Name = "terraform_private_route_table"
  }
}