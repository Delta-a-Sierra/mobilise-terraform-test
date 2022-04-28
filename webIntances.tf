resource "aws_key_pair" "web" {
  key_name   = var.web_key
  public_key = file("${var.ssh_key_path}")

}

module "web-instances" {
  source = "./modules/ec2"
  count  = 3

  instance_number    = count.index
  name               = var.webinstance_name
  owner              = var.owner
  project            = var.project
  enviroment         = var.enviroment
  ami                = var.web_ami
  public_ip_enabled  = true
  key_name           = var.web_key
  public_subnet_id   = element(module.vpc.public_subnet_ids, count.index)
  security_group_ids = [aws_security_group.web[count.index].id]

  depends_on = [
    aws_key_pair.web
  ]
}