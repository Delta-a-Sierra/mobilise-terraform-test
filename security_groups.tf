
resource "aws_security_group" "web" {
  count = length(var.public_subnets)

  name        = "web-server-${var.enviroment}"
  description = "Allow SSH and HTTP to web hosts"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.tags,
    {
      Name = format("${var.owner}-${var.enviroment}-web-%02s-sg", count.index + 1)
    }
  )
}