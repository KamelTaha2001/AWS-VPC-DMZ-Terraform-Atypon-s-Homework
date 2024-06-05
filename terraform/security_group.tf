resource "aws_security_group" "allow-ssh" {
  name        = "allow-ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.VPC1.id

  ingress {
    description = "SSH to EC2"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-ssh"
  }
}

resource "aws_security_group" "allow-sql" {
  name        = "allow-sql"
  description = "Allow SQL inbound traffic"
  vpc_id      = aws_vpc.VPC1.id

  ingress {
    description = "SQL to EC2"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-sql"
  }
}

resource "aws_security_group" "allow-http" {
  name        = "allow-http"
  description = "Allow HTTP inbound traffic"
  vpc_id      = aws_vpc.VPC1.id

  ingress {
    description = "HTTP to EC2"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-http"
  }
}

resource "aws_security_group" "allow-8080" {
  name        = "allow-8080"
  description = "Allow Web inbound traffic"
  vpc_id      = aws_vpc.VPC1.id

  ingress {
    description = "Web to EC2"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-8080"
  }
}

resource "aws_security_group" "allow-ping" {
  name        = "allow-ping"
  description = "Allow ping"
  vpc_id      = aws_vpc.VPC1.id

  ingress {
    description = "Ping"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-ping"
  }
}

resource "aws_security_group" "allow-all-outbound" {
  name        = "allow-all-outbound"
  description = "Allow all outbound traffic"
  vpc_id      = aws_vpc.VPC1.id

  egress {
    description = "All outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-all-outbound"
  }
}