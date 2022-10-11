resource "aws_lambda_function" "example_lambda" {
  function_name = "example_lambda"
  role          = aws_iam_role.iam_for_lambda.arn

  filename = var.source_filename
  source_code_hash = filebase64sha256(var.source_filename)

  // file_name.handler_name
  handler = "index.handler"
  runtime = "nodejs16.x"

#  vpc_config {
#    security_group_ids = []
#    subnet_ids         = []
#  }
}

resource "aws_api_gateway_rest_api" "lambda_api" {
  name = "lambda_api"
}
resource "aws_api_gateway_resource" "resource" {
  path_part = "resource"
  parent_id = aws_api_gateway_rest_api.lambda_api.root_resource_id
  rest_api_id = aws_api_gateway_rest_api.lambda_api.id
}
resource "aws_api_gateway_method" "method" {
  authorization = "NONE"
  http_method   = "GET"
  resource_id   = aws_api_gateway_resource.resource.id
  rest_api_id   = aws_api_gateway_rest_api.lambda_api.id
}
resource "aws_api_gateway_integration" "integration" {
  http_method = aws_api_gateway_method.method.http_method
  resource_id = aws_api_gateway_resource.resource.id
  rest_api_id = aws_api_gateway_rest_api.lambda_api.id
  integration_http_method = "POST"
  type        = "AWS_PROXY"
  uri         = aws_lambda_function.example_lambda.invoke_arn
}

resource "aws_lambda_permission" "api_gateway_lambda" {
  statement_id = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.example_lambda.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "arn:aws:execute-api:ap-northeast-2:235713525425:${aws_api_gateway_rest_api.lambda_api.id}/*/${aws_api_gateway_method.method.http_method}${aws_api_gateway_resource.resource.path}"
}

resource "aws_api_gateway_deployment" "deploy" {
  rest_api_id = aws_api_gateway_rest_api.lambda_api.id

  triggers = {
    # NOTE: The configuration below will satisfy ordering considerations,
    #       but not pick up all future REST API changes. More advanced patterns
    #       are possible, such as using the filesha1() function against the
    #       Terraform configuration file(s) or removing the .id references to
    #       calculate a hash against whole resources. Be aware that using whole
    #       resources will show a difference after the initial implementation.
    #       It will stabilize to only change when resources change afterwards.
    redeployment = sha1(jsonencode([
      aws_api_gateway_resource.resource.id,
      aws_api_gateway_method.method.id,
      aws_api_gateway_integration.integration.id,
    ]))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "stage" {
  deployment_id = aws_api_gateway_deployment.deploy.id
  rest_api_id   = aws_api_gateway_rest_api.lambda_api.id
  stage_name    = "api-stage"
}

resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}