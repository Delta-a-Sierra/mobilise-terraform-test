resource "aws_instance" "webtier" {
  count = length(aws_subnet.public.*.id)

  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = element(aws_subnet.public.*.id, count.index)
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.web[count.index].id]

  tags = merge(local.tags,
    {
      Name = format("${var.owner}-${var.enviroment}-${var.webinstance_name}-%02s-ec2", count.index + 1)
    }
  )

  volume_tags = merge(local.tags,
    {
      Name = format("${var.owner}-${var.enviroment}-${var.webinstance_name}-%02s-ec2", count.index + 1)
    }
  )
} 

