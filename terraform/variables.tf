variable "aws_region" {
  default = "eu-west-3"
}

variable "ami_id" {
  description = "AMI Ubuntu 22.04"
  default     = "ami-04ec97dc75ac850b1"
}

variable "instance_type" {
  default = "t3.medium"
}

variable "key_name" {
  description = "Nom de la clé SSH déjà existante dans AWS"
  type        = string
}

variable "private_key_path" {
  description = "Chemin local vers la clé privée"
  type        = string
}
