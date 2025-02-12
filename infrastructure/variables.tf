variable "aws_region" {
  description = "The AWS region to deploy the resources in."
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_1_cidr" {
  description = "CIDR block for the first public subnet."
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet_2_cidr" {
  description = "CIDR block for the second public subnet."
  type        = string
  default     = "10.0.2.0/24"
}

variable "public_subnet_3_cidr" {
  description = "CIDR block for the third public subnet."
  type        = string
  default     = "10.0.3.0/24"
}

variable "private_subnet_1_cidr" {
  description = "CIDR block for the first private subnet."
  type        = string
  default     = "10.0.101.0/24"
}

variable "private_subnet_2_cidr" {
  description = "CIDR block for the second private subnet."
  type        = string
  default     = "10.0.102.0/24"
}

variable "private_subnet_3_cidr" {
  description = "CIDR block for the third private subnet."
  type        = string
  default     = "10.0.103.0/24"
}

variable "az_1" {
  description = "The first availability zone."
  type        = string
  default     = "us-east-1a"
}

variable "az_2" {
  description = "The second availability zone."
  type        = string
  default     = "us-east-1b"
}

variable "az_3" {
  description = "The third availability zone."
  type        = string
  default     = "us-east-1c"
}
