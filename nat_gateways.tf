# resource "aws_nat_gateway" "ngw" {
#   count = length(var.public_subnets)
#   connectivity_type = "private"
#   subnet_id = aws_subnet.public[count.index].id

#   tags = merge(local.tags,
#     {
#       Name = "ngw${count.index}-${var.project}-${var.enviroment}"
#     }
#   )
# }