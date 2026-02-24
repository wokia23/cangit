variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "instance_tenancy" {
  description = "The instance tenancy for the VPC"
  type        = string
}

variable "vpc_tags" {
  description = "Tags to assign to the VPC"
  type        = map(string)
}

variable "publicSN_cidr_block" {
  description = "The CIDR block for the public subnet"
  type        = string
}

variable "privateSN_cidr_block" {
  description = "The CIDR block for the private subnet"
  type        = string
}
variable "pubrt_cidrblock" {
  type = string
}

variable "privatert_cidrblock" {
  type = string
}

variable "ec2_ami" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}

variable "ec2_instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
}
