resource "aws_launch_configuration" "web" {
  name_prefix   = "${var.owner}-${var.enviroment}-lc"
  image_id      = var.ami
  instance_type = var.instance_type
  security_groups = [aws_security_group.web.id]
  key_name = aws_key_pair.web.key_name

  user_data = file("./files/setup-webserver.sh")

  lifecycle {
    create_before_destroy = true
  }
}