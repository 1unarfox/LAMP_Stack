variable "instance_type" {
  type = string
  default = "t2.small"
  description = "Provide the instance type for your EC2."
}

variable "key_name" {
  default = "lamp_test"
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

variable "ami_id" {
  default = "ami-026b57f3c383c2eec"
  description = "AMI ID of the image you'd like to use."
}

variable "state_bucket" {
  default = "tf-state-poc-storage"
  description = "S3 bucket where you're storing your .tfstate."
}

variable "gitlab_token" {}