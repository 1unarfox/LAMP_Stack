variable "instance_type" {
  type = string
  default = "t2.small"
  description = "Provide the instance type for your EC2."
}

variable "key_name" {
  default = ""
  description = "Name of the EC2 instance key pair you wish to use"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
  description = "CIDR of the demo VPC"
}

variable "region" {
  default = "us-east-1"
  description = "Target region of your LAMP stack deployment."
}