output "api_execution_url" {
  value = "${aws_apigatewayv2_stage.this.invoke_url}/api/lambda"
}

output "api_url" {
  value = "${aws_apigatewayv2_api.this.id}.execute-api.${var.region}.amazonaws.com"
}

output "api_execution_arn" {
  value = aws_apigatewayv2_api.this.execution_arn
}
