// AWS specific vars
variable "aws_access_key" {
  default     = "AKIAQ4MGVCT4KHATVTBO"
  description = "AWS access key (AWS_ACCESS_KEY_ID)."
}

variable "aws_secret_key" {
  description = "AWS secret key (AWS_SECRET_ACCESS_KEY)."
}

variable "aws_region" {
  description = "AWS region"
  default     = "eu-west-1"
}

// VPC vars
variable "availability_zones" {
  default     = "eu-west-1a,eu-west-1b,eu-west-1c"
  description = "List of availability zones"
}

variable "vpc_cidr" {
  description = "CIDR for VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_az1_cidr" {
  description = "CIDR for az1 public subnet"
  default     = "10.0.10.0/24"
}

variable "public_subnet_az2_cidr" {
  description = "CIDR for az2 public subnet"
  default     = "10.0.11.0/24"
}

variable "public_subnet_az3_cidr" {
  description = "CIDR for az3 public subnet"
  default     = "10.0.12.0/24"
}

variable "private_subnet_az1_cidr" {
  description = "CIDR for az1 private subnet"
  default     = "10.0.20.0/24"
}

variable "private_subnet_az2_cidr" {
  description = "CIDR for az2 private subnet"
  default     = "10.0.21.0/24"
}

variable "private_subnet_az3_cidr" {
  description = "CIDR for az3 private subnet"
  default     = "10.0.22.0/24"
}

// EC2 vars

variable "instance_type" {
  description = "Instance type"
  default     = "t3.medium"
}

variable "app_name" {
  description = "app name to be deployed"
  default     = "Django-WebApp"
}


