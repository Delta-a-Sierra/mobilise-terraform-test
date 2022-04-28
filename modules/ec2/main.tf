resource "aws_instance" "ec2" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.public_subnet_id
  associate_public_ip_address = var.public_ip_enabled
  vpc_security_group_ids = var.security_group_ids

  tags = merge(local.tags,
    {
      Name = "instance${var.instance_number}-${var.name}-${var.project}-${var.enviroment}"
    }
  )

  volume_tags = merge(local.tags,
    {
      Name = "instance${var.instance_number}-${var.name}-${var.project}-${var.enviroment}"
    }
  )
} 

