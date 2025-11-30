# AWS region for all cloud resources
region = "us-east-1"

# Range of IP addresses for vpc
vpc_cidr = "10.0.1.0/24"

# Range of IP addresses for public subnet 1
public_subnet1_cidr = "10.0.1.0/28"

# Range of IP addresses for private subnet 1 of load balancer
private_subnet1_lb_cidr = "10.0.1.16/28"

# Range of IP addresses for private subnet 1 of eks
private_subnet1_eks_cidr = "10.0.1.32/27"

# Range of IP addresses for private subnet 2 of eks
private_subnet2_eks_cidr = "10.0.1.64/27"

# Range of IP addresses for private subnet 1 of rds
private_subnet1_rds_cidr = "10.0.1.96/28"

# Range of IP addresses for private subnet 2 of rds
private_subnet2_rds_cidr = "10.0.1.112/28"

# Public IP of architect
public_ip_architect = "163.116.169.116/32"

# Role of node group for eks
eks_ng_role = "CustomAWSServiceRoleForAmazonEKSNodegroup"
