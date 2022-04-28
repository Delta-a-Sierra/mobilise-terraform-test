resource "aws_instance" "ec2" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.public_subnet_id
  associate_public_ip_address = var.public_ip_enabled
  vpc_security_group_ids = var.security_group_ids

  tags = merge(local.tags,
    {
      Name = format("${var.owner}-${var.enviroment}-${var.name}-%02s-ec2", var.instance_number + 1)
    }
  )

  volume_tags = merge(local.tags,
    {
      Name = format("${var.owner}-${var.enviroment}-${var.name}-%02s-ec2", var.instance_number + 1)
    }
  )
} 

