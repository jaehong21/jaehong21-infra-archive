resource "aws_vpc" "sigor_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "sigor_vpc"
  }
}

resource "aws_subnet" "sigor_subnet_a" {
  vpc_id = aws_vpc.sigor_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "sigor_subnet_a"
  }
}
resource "aws_subnet" "sigor_subnet_b" {
  vpc_id = aws_vpc.sigor_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-northeast-2b"
  tags = {
    Name = "sigor_subnet_b"
  }
}

resource "aws_internet_gateway" "sigor_internet_gateway" {
    vpc_id = aws_vpc.sigor_vpc.id
    tags = {
        Name = "sigor_internet_gateway"
    }
}

resource "aws_route_table" "default_route_table" {
  vpc_id = aws_vpc.sigor_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.sigor_internet_gateway.id
  }
  tags = {
    Name = "sigor_route_table"
  }
}
resource "aws_route_table_association" "sigor_subnet_a_association" {
  subnet_id      = aws_subnet.sigor_subnet_a.id
  route_table_id = aws_route_table.default_route_table.id
}
resource "aws_route_table_association" "sigor_subnet_b_association" {
  subnet_id      = aws_subnet.sigor_subnet_b.id
  route_table_id = aws_route_table.default_route_table.id
}