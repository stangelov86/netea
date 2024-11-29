variable "region" {
  description = "AWS region for the REST API Gateway"
  type        = string
}

variable "lambda_function_invoke_arn" {
  description = "The invoke ARN of the Lambda function to integrate with API Gateway"
  type        = string
}

variable "environment" {
  description = "Name of environment"
  type        = string
}
