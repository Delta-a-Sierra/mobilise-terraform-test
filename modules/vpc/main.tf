resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block

  tags = merge(local.tags,
    {
      Name = "vpc-${var.project}-${var.enviroment}"
    }
  )
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(local.tags,
    {
      Name = "igw$-${var.project}-${var.enviroment}"
    }
  )
}

resource "aws_route" "internet_access" {
  route_table_id         = aws_vpc.vpc.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_nat_gateway" "ngw" {
  count = length(var.public_subnets)
  connectivity_type = "private"
  subnet_id = aws_subnet.public[count.index].id

  tags = merge(local.tags,
    {
      Name = "ngw${count.index}-${var.project}-${var.enviroment}"
    }
  )
}