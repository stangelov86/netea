output "cdn_distribution_domain" {
  value = module.cloudfront.distribution_domain
}

output "api_gateway_url" {
  value = module.api_gateway.api_execution_url
}

output "cdn_api_url" {
  value = module.cloudfront.distribution_domain_api
}
 