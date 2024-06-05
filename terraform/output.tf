output "bastion-public-ip" {
  value = aws_instance.bastion-server.public_ip
}

output "web-apps-private-ips" {
  value = aws_instance.web-server.*.private_ip
}

output "elb-dns-name" {
  value = aws_lb.application-lb.dns_name
}