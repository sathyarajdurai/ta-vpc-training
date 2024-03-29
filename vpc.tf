resource "aws_vpc" "lab_vpc" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.lab_vpc.id
  cidr_block = var.cidr_public
  availability_zone = "eu-west-1a"

  tags = {
    Name = "public"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.lab_vpc.id
  cidr_block = var.cidr_private
  availability_zone = "eu-west-1b"

  tags = {
    Name = "private"
  }
}

resource "aws_subnet" "data" {
  for_each = var.cidr_data

  vpc_id     = aws_vpc.lab_vpc.id
  cidr_block = each.value
  availability_zone = join("",[var.aws_region, each.key])

  tags = {
    Name = join("-",["data", each.key])
  }
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.lab_vpc.id

  tags = {
    Name = "internet gateway"
  }
}

resource "aws_eip" "nat_eip" {
  vpc      = true
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "NAT"
  }
 # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}