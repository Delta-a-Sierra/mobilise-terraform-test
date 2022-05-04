resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(local.tags,
    {
      Name = "${var.owner}-${var.enviroment}-pub-subnet-rtbl"
    }
  )
}