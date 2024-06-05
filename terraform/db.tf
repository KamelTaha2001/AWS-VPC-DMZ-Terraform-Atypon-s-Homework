resource "aws_db_subnet_group" "backend-db-subnet-group" {
  name       = "main"
  subnet_ids = [aws_subnet.back-end-subnet.id, aws_subnet.back-end-secondary-subnet.id]

  tags = {
    Name = "Backend DB subnet group"
  }
}

resource "aws_db_instance" "back-end-db" {
  allocated_storage        = 20
  storage_type             = "gp2"
  engine                   = "mysql"
  engine_version           = "5.7"
  instance_class           = "db.t3.micro"
  db_name                  = "names_db"
  username                 = "user"
  password                 = "password"
  parameter_group_name     = "default.mysql5.7"
  db_subnet_group_name     = aws_db_subnet_group.backend-db-subnet-group.id
  vpc_security_group_ids   =  [
    aws_security_group.allow-sql.id,
    aws_security_group.allow-all-outbound.id,
  ]
  skip_final_snapshot      = true
}