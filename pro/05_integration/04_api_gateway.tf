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
  subnet_ids         = [data.terraform_remote_state.networking.outputs.my_private_subnet1_lb_id]
}

resource "aws_apigatewayv2_authorizer" "my_apigateway_authorizer" {
  name             = "my-apigateway-authorizer"
  api_id           = aws_apigatewayv2_api.my_apigateway.id
  authorizer_type  = "JWT"
  identity_sources = ["$request.header.Authorization"]

  jwt_configuration {
    audience = [var.apigateway_jwt_configuration_audience]
    issuer   = var.apigateway_jwt_configuration_issuer
  }
}
/*
resource "aws_apigatewayv2_integration" "my_apigateway_integration" {
  api_id             = aws_apigatewayv2_api.my_apigateway.id
  integration_type   = "HTTP_PROXY"
  integration_uri    = var.apigateway_integration_uri
  integration_method = "ANY"
  connection_type    = "VPC_LINK"
  connection_id      = aws_apigatewayv2_vpc_link.my_apigateway_vpc_link.id
}

resource "aws_apigatewayv2_route" "my_apigateway_route" {
  api_id             = aws_apigatewayv2_api.my_apigateway.id
  route_key          = "ANY /workshop/bets"
  target             = "integrations/${aws_apigatewayv2_integration.my_apigateway_integration.id}"
  authorization_type = "JWT"
  authorizer_id      = aws_apigatewayv2_authorizer.my_apigateway_authorizer.id
}*/
