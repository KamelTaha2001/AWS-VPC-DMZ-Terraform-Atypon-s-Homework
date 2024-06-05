resource "aws_instance" "bastion-server" {
  depends_on                  = [aws_key_pair.ec2-key-pair]
  subnet_id                   = aws_subnet.dmz-subnet.id
  ami                         = "ami-0f403e3180720dd7e"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  key_name                    = "kamel_key_pair"
  vpc_security_group_ids      = [aws_security_group.allow-ssh.id, aws_security_group.allow-all-outbound.id]

  tags = {
    Name    = "Bastion Server"
  }
}

resource "aws_instance" "web-server" {
  count                       = 2
  depends_on                  = [aws_key_pair.ec2-key-pair, aws_db_instance.back-end-db]
  subnet_id                   = aws_subnet.front-end-subnet.id
  ami                         = "ami-02c67c791feb6c7ba" # ami of my custom amazon image
  instance_type               = "t2.micro"
  associate_public_ip_address = false
  key_name                    = "kamel_key_pair"
  vpc_security_group_ids      = [
    aws_security_group.allow-ssh.id,
    aws_security_group.allow-8080.id,
    aws_security_group.allow-all-outbound.id,
    aws_security_group.allow-ping.id
  ]

  user_data = <<-EOF
                #!/bin/bash
                sudo su
                yum update -y
                nohup java -jar /home/ec2-user/webapp.jar --DB_HOST=${aws_db_instance.back-end-db.address} --DB_PORT=${aws_db_instance.back-end-db.port} --DB_USER=user --DB_PASSWORD=password --DB_NAME=names_db > /home/ec2-user/output.log
              EOF

  tags = {
    Name ="instance-${count.index}"
  }
}