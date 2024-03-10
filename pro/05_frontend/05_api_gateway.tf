resource "aws_apigatewayv2_api" "my_apigateway" {
  name          = "my-http-api"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_stage" "my_apigateway_stage" {
  api_id      = aws_apigatewayv2_api.my_apigateway.id
  name        = "$default"
  auto_deploy = true

  default_route_settings {
    throttling_burst_limit = 100
    throttling_rate_limit  = 200
  }
}

resource "aws_apigatewayv2_vpc_link" "my_apigateway_vpc_link" {
  name               = "my-vpc-link"
  security_group_ids = [data.terraform_remote_state.networking.outputs.my_vpc1_default_security_group_id]
  subnet_ids         = [data.terraform_remote_state.networking.outputs.my_subnet2_id]
}

resource "aws_apigatewayv2_integration" "my_apigateway_integration" {
  api_id             = aws_apigatewayv2_api.my_apigateway.id
  integration_type   = "HTTP_PROXY"
  integration_uri    = "arn:aws:elasticloadbalancing:us-east-1:321450538187:listener/net/a35d9dbb9e5574daea3482bc8062521f/04b700a98ec2725e/fc5040136283a3b7"
  integration_method = "ANY"
  connection_type    = "VPC_LINK"
  connection_id      = aws_apigatewayv2_vpc_link.my_apigateway_vpc_link.id
}

resource "aws_apigatewayv2_authorizer" "my_apigateway_authorizer" {
  name             = "my-apigateway-authorizer"
  api_id           = aws_apigatewayv2_api.my_apigateway.id
  authorizer_type  = "JWT"
  identity_sources = ["$request.header.Authorization"]

  jwt_configuration {
    audience = ["3n1njpk1b3185mkl0n4glee5pj"]
    issuer   = "https://cognito-idp.us-east-1.amazonaws.com/us-east-1_95Aqh0NSu"
  }
}

resource "aws_apigatewayv2_route" "my_apigateway_route" {
  api_id             = aws_apigatewayv2_api.my_apigateway.id
  route_key          = "ANY /workshop/bets"
  target             = "integrations/${aws_apigatewayv2_integration.my_apigateway_integration.id}"
  authorization_type = "JWT"
  authorizer_id      = aws_apigatewayv2_authorizer.my_apigateway_authorizer.id
}
