resource "aws_route_table" "public-routes" {
  vpc_id = aws_vpc.VPC1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "VPC1_PUBLIC_RTBL"
  }
}

resource "aws_route_table" "private-routes" {
  vpc_id = aws_vpc.VPC1.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gw.id
  }

  tags = {
    Name = "VPC1_PRIVATE_RTBL"
  }
}