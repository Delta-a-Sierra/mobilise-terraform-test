# resource "aws_nat_gateway" "ngw" {
#   count = length(var.public_subnets)
#   connectivity_type = "public"
#   allocation_id = aws_eip.ngw[count.index].id
#   subnet_id = aws_subnet.public[count.index].id

#   tags = merge(local.tags,
#     {
#       Name = "ngw${count.index}-${var.project}-${var.enviroment}"
#     }
#   )
# }

# resource "aws_eip" "ngw" {
#   count = length(var.public_subnets)
#   vpc = true
# }