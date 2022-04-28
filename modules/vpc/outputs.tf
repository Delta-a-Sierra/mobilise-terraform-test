output "public_subnet_ids" {
  description = "list of the vpc's public subnet id's"
  value = aws_subnet.public[*].id
}

output "vpc_id" {
  description = "id of the vpc"
  value = aws_vpc.vpc.id
}