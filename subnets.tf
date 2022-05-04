resource "aws_subnet" "public" {
  count = length(var.public_subnets)
  
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_subnets[count.index]
  availability_zone = element(data.aws_availability_zones.azs.names, count.index)
  map_public_ip_on_launch = true

  tags = merge(local.tags,
    {
      Name = "${var.owner}-${var.enviroment}-pub-subnet-${substr(element(data.aws_availability_zones.azs.names, count.index), -1, -1)}"
    }
  )
}
