resource "aws_lb_target_group" "target-group" {
  name        = "nit-tg"
  port        = 8080
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.VPC1.id

  health_check {
    enabled             = true
    interval            = 10
    path                = "/health"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 6
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb" "application-lb" {
  name               = "nit-alb"
  depends_on         = [aws_instance.web-server]
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.dmz-subnet.id, aws_subnet.dmz-secondary-subnet.id]
  security_groups    = [aws_security_group.allow-http.id, aws_security_group.allow-all-outbound.id]
  ip_address_type    = "ipv4"

  tags = {
    name = "nit-alb"
  }
}

resource "aws_lb_listener" "alb-listener" {
  load_balancer_arn = aws_lb.application-lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target-group.arn
  }
}

resource "aws_lb_target_group_attachment" "ec2-web-attachment" {
  count            = length(aws_instance.web-server)
  target_group_arn = aws_lb_target_group.target-group.arn
  target_id        = aws_instance.web-server[count.index].id
}