variable "ami" {
  type = string
  description = "image to be used when creating the instance"
}

variable "instance_type" {
  type = string
  description = "size of the instance"
  default = "t2.micro"
}

variable "key_name" {
  type = string
  description = "name of the ssh key to be used to connect to the instance"
}

variable "public_subnet_id" {
  type = string
  description = "id for the subnet the instance will be deployed to"
}

variable "security_group_ids" {
  type = list(string)
  description = "ID's of the security groups to be attached to the instance"
}

variable "name" {
  type = string
  description = "name of instance"
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

variable "instance_number" {
  type = number
  description = "used to name instance with a number when count is used"
  default = 0
}

variable "public_ip_enabled" {
  type = bool
  description = "bool to assign or not assign a public ip to the instance"
  default = false
}