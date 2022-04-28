variable "cidr_block" {
  type = string
  description = "address space to be used for the vpc"
}

variable "public_subnets" {
  type = list
  description = "list of public subnet address spaces"
  default = []
}

variable "private_subnets" {
  type = list
  description = "list of private subnet address spaces"
  default = []
}

variable "owner" {
  type = string
  description = "owner of the resources being created"
}

variable "project" {
  type = string
  description = "the name of the project"
}

variable "enviroment" {
  type = string
  description = "the enviroment resources are being used for eg dev/prod"
}