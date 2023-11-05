data "aws_iam_role" "my_eks_role" {
  name = "CustomAWSServiceRoleForAmazonEKS"
}

resource "aws_eks_cluster" "my_eks" {
  name     = "my_eks"
  role_arn = data.aws_iam_role.my_eks_role.arn
  version  = "1.28"

  vpc_config {
    subnet_ids = [
      data.terraform_remote_state.networking.outputs.my_subnet2_id,
      data.terraform_remote_state.networking.outputs.my_subnet3_id,
      data.terraform_remote_state.networking.outputs.my_subnet4_id,
      data.terraform_remote_state.networking.outputs.my_subnet5_id,
      data.terraform_remote_state.networking.outputs.my_subnet6_id
    ]
    endpoint_private_access = true
    endpoint_public_access  = true
    public_access_cidrs     = [var.public_ip_architect]
  }

  tags = {
    Name = "my_eks"
  }
}

data "aws_iam_role" "my_eks_ng_role" {
  name = "CustomAWSServiceRoleForAmazonEKSNodegroup"
}

resource "aws_eks_node_group" "my_eks_ng" {
  cluster_name    = aws_eks_cluster.my_eks.name
  node_group_name = "my_eks_ng"
  node_role_arn   = data.aws_iam_role.my_eks_ng_role.arn
  subnet_ids      = [data.terraform_remote_state.networking.outputs.my_subnet3_id, data.terraform_remote_state.networking.outputs.my_subnet4_id]
  capacity_type   = "SPOT"
  ami_type        = "AL2_x86_64"
  instance_types  = ["t3.medium"]

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 0
  }

  update_config {
    max_unavailable = 1
  }
}

resource "aws_security_group_rule" "my_sgr2" {
  type                     = "ingress"
  from_port                = 5432
  to_port                  = 5432
  protocol                 = "tcp"
  source_security_group_id = aws_eks_cluster.my_eks.vpc_config[0].cluster_security_group_id
  security_group_id        = data.terraform_remote_state.networking.outputs.my_vpc1_default_security_group_id
}
