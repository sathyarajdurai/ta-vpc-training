variable "vpc_name" {
    description = "This is the VPC name"
    type = string
}

variable "aws_region" {
    description = "This is the region of vpc"
}

variable "vpc_cidr" {
    description = "This is the CIDR of vpc"
}

variable "cidr_public" {
    description = "This is the CIDR of public vpc"
}

variable "cidr_private" {
    description = "This is the CIDR of private vpc"
}

variable "cidr_data" {
    type = map
    description = "This is the CIDR of data vpc"
}