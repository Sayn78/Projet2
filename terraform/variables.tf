variable "aws_region" {
  type    = string
  default = "eu-west-3" # Paris
}

variable "ami_id" {
  type = string
  description = "AMI Ubuntu (ex: ami-07ace442b039f8861)"
}

variable "instance_type" {
  type    = string
  default = "t3.medium"
}

variable "key_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "private_key_path" {
  type = string
  default = "~/.ssh/id_rsa"
}
