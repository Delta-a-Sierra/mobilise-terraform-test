resource "aws_lb_target_group" "web" {
  name        = "${var.owner}-${var.enviroment}-ltg"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.vpc.id

  health_check {
    healthy_threshold = 5
    matcher = 200
    port = 80
    unhealthy_threshold = 3
  }
}
