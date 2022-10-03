data "aws_ami" "az_linux" {
most_recent = true
provider = aws
owners = ["137112412989"] # Canonical

  filter {
      name   = "name"
      values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
  }

  filter {
      name   = "virtualization-type"
      values = ["hvm"]
  }
}

data "aws_availability_zones" "azs" {}