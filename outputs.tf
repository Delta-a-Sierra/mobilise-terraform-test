
output "alb_dns_name" {
  description = "dns for frontend internet facing load balancer"
  value = aws_lb.web.dns_name
}

output "bastion_ip" {
  value = aws_instance.bastion.public_ip
}