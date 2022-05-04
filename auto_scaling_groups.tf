
resource "aws_autoscaling_group" "web" {
  name =  "${var.owner}-${var.enviroment}-asg"
  vpc_zone_identifier = aws_subnet.public.*.id 
  launch_configuration = aws_launch_configuration.web.id
  desired_capacity   = 3
  max_size           = 3
  min_size           = 3

  dynamic "tag" {
    for_each = merge(local.tags, {
        name = "${var.owner}-${var.enviroment}-web-ec2"
      }
    )
    content {
      key = tag.key
      value = tag.value
      propagate_at_launch = true
    }
  }
}

resource "aws_autoscaling_attachment" "web" {
  autoscaling_group_name = aws_autoscaling_group.web.id
  alb_target_group_arn =   aws_lb_target_group.web.arn
}

