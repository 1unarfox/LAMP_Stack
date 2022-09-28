#############################################

#Creating Virtual Private Cloud:

#############################################
resource "aws_vpc" "lamp_vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = var.instance_tenancy
  enable_dns_support   = true
  enable_dns_hostnames = true
}

#############################################

# Creating Public subnet:

#############################################

resource "aws_subnet" "public_subnet" {
  count             = var.custom_vpc == "10.0.0.0/16" ? 3 : 0
  vpc_id            = aws_vpc.lamp_vpc.id
  availability_zone = data.aws_availability_zones.azs.names[count.index]
  cidr_block        = element(cidrsubnets(var.lamp_vpc, 8, 4, 4), count.index)

  tags = {
    "Name" = "Public-Subnet-${count.index}"
  }
}

#############################################

# Creating Internet Gateway:

#############################################

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.lamp_vpc.id

  tags = {
    "Name" = "LAMP-Internet-Gateway"
  }
}

#############################################

# Creating Public Route Table:

#############################################
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.lamp_vpc.id

  tags = {
    "Name" = "LAMP-Public-RouteTable"
  }
}

#############################################

# Creating Public Route:

#############################################

resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

#############################################

# Creating Public Route Table Association:

#############################################

resource "aws_route_table_association" "public_rt_association" {
  count          = length(aws_subnet.public_subnet) == 3 ? 3 : 0
  route_table_id = aws_route_table.public_rt.id
  subnet_id      = element(aws_subnet.public_subnet.*.id, count.index)
}