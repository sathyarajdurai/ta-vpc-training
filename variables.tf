variable "vpc_name" {
    description = "This is the VPC name"
    type = string
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
    description = "This is the CIDR of data vpc"
}