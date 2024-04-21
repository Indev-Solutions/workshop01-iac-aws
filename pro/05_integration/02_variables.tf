variable "region" {
  type        = string
  description = "AWS region for all cloud resources"
}

variable "vpc_cidr" {
  type        = string
  description = "Range of IP addresses for vpc"
}

variable "public_subnet1_cidr" {
  type        = string
  description = "Range of IP addresses for public subnet 1"
}

variable "private_subnet1_lb_cidr" {
  type        = string
  description = "Range of IP addresses for private subnet 1 of load balancer"
}

variable "private_subnet1_eks_cidr" {
  type        = string
  description = "Range of IP addresses for private subnet 1 of eks"
}

variable "private_subnet2_eks_cidr" {
  type        = string
  description = "Range of IP addresses for private subnet 2 of eks"
}

variable "private_subnet1_rds_cidr" {
  type        = string
  description = "Range of IP addresses for private subnet 1 of rds"
}

variable "private_subnet2_rds_cidr" {
  type        = string
  description = "Range of IP addresses for private subnet 2 of rds"
}

variable "public_ip_architect" {
  type        = string
  description = "Public IP of architect"
}

variable "eks_ng_role" {
  type        = string
  description = "Role of node group for eks"
}
