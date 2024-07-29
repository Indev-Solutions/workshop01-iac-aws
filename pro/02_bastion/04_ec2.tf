resource "aws_network_interface" "my_ni1" {
  subnet_id = data.terraform_remote_state.networking.outputs.my_public_subnet1_id

  tags = {
    Name = "my_ni1"
  }
}

resource "aws_instance" "my_instance1" {
  ami                  = "ami-053b0d53c279acc90"
  instance_type        = "t2.micro"
  key_name             = "kp01workshop"
  iam_instance_profile = var.eks_ng_role

  network_interface {
    network_interface_id = aws_network_interface.my_ni1.id
    device_index         = 0
  }

  tags = {
    Name = "my_instance1"
  }

  user_data = data.template_file.startup_script.rendered
}

data "template_file" "startup_script" {
  template = file("script.sh")

  vars = {
    SCRIPT_DESCRIPTION = "Deploying configuration of bastion"
  }
}

resource "aws_eip" "my_eip_ec2" {
  instance = aws_instance.my_instance1.id
  domain   = "vpc"

  tags = {
    Name = "my_eip_ec2"
  }
}

resource "aws_security_group_rule" "my_sgr1" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [var.public_ip_architect]
  security_group_id = data.terraform_remote_state.networking.outputs.my_vpc1_default_security_group_id
}
