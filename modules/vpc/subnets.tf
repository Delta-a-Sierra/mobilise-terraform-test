resource "aws_subnet" "public" {
  count = length(var.public_subnets)
  
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_subnets[count.index]
  availability_zone = element(data.aws_availability_zones.azs.names, count.index)

  tags = merge(local.tags,
    {
      Name = "${var.owner}-${var.enviroment}-${var.project}-pub-subnet-${substr(element(data.aws_availability_zones.azs.names, count.index), -1, -1)}"
    }
  )
}

resource "aws_route_table" "public" {
  count = length(var.public_subnets)
  vpc_id = aws_vpc.vpc.id

  tags = merge(local.tags,
    {
      Name = "${var.owner}-${var.enviroment}-${var.project}-pub-subnet-${substr(aws_subnet.public[count.index].availability_zone, -1, -1)}-rtbl"
    }
  )
}

resource "aws_route" "public" {
  count = length(var.public_subnets)

  route_table_id         = aws_route_table.public[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public" {
  count = length(var.public_subnets)

  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public[count.index].id
}