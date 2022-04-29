resource "aws_route_table" "public" {
  count = length(var.public_subnets)
  vpc_id = aws_vpc.vpc.id

  tags = merge(local.tags,
    {
      Name = "${var.owner}-${var.enviroment}-pub-subnet-${substr(aws_subnet.public[count.index].availability_zone, -1, -1)}-rtbl"
    }
  )
}