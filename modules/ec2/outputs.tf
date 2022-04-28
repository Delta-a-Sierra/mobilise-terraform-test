output "public_ip" {
  description = "public ip of the instance"
  value = coalesce(aws_instance.ec2.public_ip, "")
}