resource "aws_apigatewayv2_vpc_link" "my_apigateway_vpc_link" {
  name               = "my-vpc-link"
  security_group_ids = [data.terraform_remote_state.networking.outputs.my_vpc1_default_security_group_id]
  subnet_ids         = [data.terraform_remote_state.networking.outputs.my_private_subnet1_lb_id]
}
