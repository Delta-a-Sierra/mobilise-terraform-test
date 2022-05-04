
resource "aws_instance" "bastion" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = aws_key_pair.bastion.key_name
  subnet_id     = aws_subnet.public[0].id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.bastion.id]

  tags = merge(local.tags,
    {
      Name = "${var.owner}-${var.enviroment}-${var.webinstance_name}-bastion"
    }
  )

  volume_tags = merge(local.tags,
    {
      Name = "${var.owner}-${var.enviroment}-${var.webinstance_name}-bastion"
    }
  )
} 

