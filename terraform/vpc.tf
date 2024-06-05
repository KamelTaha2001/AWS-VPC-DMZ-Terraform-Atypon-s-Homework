resource "aws_vpc" "VPC1" {
  cidr_block = "10.55.0.0/16"
  tags = {
    Name = "VPC1"
  }
}