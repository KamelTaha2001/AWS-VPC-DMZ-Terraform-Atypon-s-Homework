resource "aws_subnet" "dmz-subnet" {
  vpc_id            = aws_vpc.VPC1.id
  availability_zone = "us-east-1a"
  cidr_block        = "10.55.10.0/24"
  tags = {
    Name = "dmz-subnet"
  }
}

resource "aws_subnet" "dmz-secondary-subnet" {
  vpc_id            = aws_vpc.VPC1.id
  availability_zone = "us-east-1b"
  cidr_block        = "10.55.11.0/24"
  tags              = {
    Name = "dmz-secondary-subnet"
  }
}

resource "aws_subnet" "front-end-subnet" {
  vpc_id            = aws_vpc.VPC1.id
  availability_zone = "us-east-1a"
  cidr_block        = "10.55.12.0/24"
  tags = {
    Name = "front-end-subnet"
  }
}

resource "aws_subnet" "back-end-subnet" {
  vpc_id            = aws_vpc.VPC1.id
  availability_zone = "us-east-1a"
  cidr_block        = "10.55.13.0/24"
  tags = {
    Name = "back-end-subnet"
  }
}

resource "aws_subnet" "back-end-secondary-subnet" {
  vpc_id            = aws_vpc.VPC1.id
  availability_zone = "us-east-1b"
  cidr_block        = "10.55.14.0/24"
  tags = {
    Name = "back-end-secondary-subnet"
  }
}