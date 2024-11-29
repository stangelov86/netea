variable "s3_origin_domain" {
  description = "The domain of the S3 origin for the CloudFront distribution"
  type        = string
}

variable "api_origin_domain" {
  description = "The domain of the API Gateway origin for the CloudFront distribution"
  type        = string
}

variable "environment" {
  description = "Name of environment"
  type        = string
}
