resource "aws_subnet" "public" {
  count = length(var.public_subnets)
  
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_subnets[count.index]
  availability_zone = element(data.aws_availability_zones.azs.names, count.index)

  tags = merge(local.tags,
    {
      Name = "pubsub${count.index}-${var.project}-${var.enviroment}"
    }
  )
}