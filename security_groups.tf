
resource "aws_security_group" "web" {
  name        = "${var.owner}-${var.enviroment}-web-sg"
  description = "Allow SSH and HTTP to web hosts"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [ aws_security_group.bastion.id]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [ aws_security_group.alb.id ]
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
    security_groups = [ aws_security_group.bastion.id]
  }

  tags = merge(local.tags,
    {
      Name = "${var.owner}-${var.enviroment}-web-sg"
    }
  )
}

resource "aws_security_group" "alb" {
  name        = "${var.owner}-${var.enviroment}-alb-sg"
  description = "HTTP to alb"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.tags,
    {
      Name = "${var.owner}-${var.enviroment}-alb-sg"
    }
  )
}

resource "aws_security_group" "bastion" {
  name        = "${var.owner}-${var.enviroment}-bastion-sg"
  description = "HTTP to alb"
  vpc_id      = aws_vpc.vpc.id

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


  tags = merge(local.tags,
    {
      Name = "${var.owner}-${var.enviroment}-bastion-sg"
    }
  )
}