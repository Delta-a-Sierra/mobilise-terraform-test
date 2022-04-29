resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block

  tags = merge(local.tags,
    {
      Name = "${var.owner}-${var.enviroment}-vpc"
    }
  )
}