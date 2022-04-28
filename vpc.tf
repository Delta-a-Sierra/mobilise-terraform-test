module "vpc" {
  source         = "./modules/vpc"
  cidr_block     = var.cidr_block
  owner          = var.owner
  project        = var.project
  enviroment     = var.enviroment
  public_subnets = var.public_subnets
}