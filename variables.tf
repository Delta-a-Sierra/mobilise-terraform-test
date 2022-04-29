

variable "region" {
  type        = string
  description = "region in which resources are to be created"
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

####################        VPC VARS       ###############################

variable "cidr_block" {
  type        = string
  description = "address space to be used in the vpc"
}

variable "public_subnets" {
  type        = list(string)
  description = "list of public subnet address spaces"
  default     = []
}

####################        EC2 VARS       ###############################

variable "webinstance_name" {
  type        = string
  description = "name to identify instance"
}

variable "ami" {
  type        = string
  description = "image to be used when creating the instance"
}

variable "instance_type" {
  type        = string
  description = "size of the instance"
  default     = "t2.micro"
}

variable "key_name" {
  type        = string
  description = "name of the ssh key to be used to connect to the instance"
}

variable "ssh_key_path" {
  type        = string
  description = "path to the public ssh key"
  default     = "~/.ssh/id_rsa.pub"
}

