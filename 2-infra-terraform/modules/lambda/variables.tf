variable "runtime" {
  description = "The runtime for the Lambda function"
  type        = string
  default     = "nodejs18.x"
}

variable "environment_variables" {
  description = "Environment variables for the Lambda function"
  type        = map(string)
  default     = {}
}

variable "api_execution_arn" {
  description = "The Execution ARN of the API Gateway"
  type        = string
}

variable "environment" {
  description = "Name of environment"
  type        = string
}
