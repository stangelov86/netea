output "distribution_domain" {
  value = aws_cloudfront_distribution.this.domain_name
}

output "distribution_arn" {
  value = aws_cloudfront_distribution.this.arn
}

output "distribution_domain_api" {
  value = "${aws_cloudfront_distribution.this.domain_name}/api/lambda"
}
