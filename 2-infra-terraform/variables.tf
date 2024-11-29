variable "aws_access_key" {
  description = "AWS Access Key ID for authentication"
}

variable "aws_secret_key" {
  description = "AWS Secret Access Key for authentication"
}

variable "aws_region" {
  description = "AWS region where resources will be provisioned"
  type        = string
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
  default     = "netea-test-bucket"
}

variable "environment" {
  description = "Name of environment"
  type        = string
  default     = "Staging"
}
