resource "aws_route_table_association" "dmz-association" {
  subnet_id      = aws_subnet.dmz-subnet.id
  route_table_id = aws_route_table.public-routes.id
}

resource "aws_route_table_association" "dmz-secondary-association" {
  subnet_id      = aws_subnet.dmz-secondary-subnet.id
  route_table_id = aws_route_table.public-routes.id
}

resource "aws_route_table_association" "front-end-association" {
  subnet_id      = aws_subnet.front-end-subnet.id
  route_table_id = aws_route_table.private-routes.id
}

resource "aws_route_table_association" "back-end-association" {
  subnet_id      = aws_subnet.back-end-subnet.id
  route_table_id = aws_route_table.private-routes.id
}

resource "aws_route_table_association" "back-end-secondary-association" {
  subnet_id      = aws_subnet.back-end-secondary-subnet.id
  route_table_id = aws_route_table.private-routes.id
}