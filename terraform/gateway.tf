resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.VPC1.id

  tags = {
    Name = "VPC1_GW"
  }
}

resource "aws_eip" "nat_eip" {
  vpc = true
}

resource "aws_nat_gateway" "nat-gw" {
  subnet_id = aws_subnet.dmz-subnet.id
  allocation_id = aws_eip.nat_eip.id

  depends_on = [aws_internet_gateway.gw]
}