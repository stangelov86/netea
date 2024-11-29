module "s3" {
  source                      = "./modules/s3"
  bucket_name                 = var.bucket_name
  cloudfront_distribution_arn = module.cloudfront.distribution_arn
  environment                 = var.environment
}

module "cloudfront" {
  source            = "./modules/cloudfront"
  s3_origin_domain  = module.s3.bucket_regional_domain_name
  api_origin_domain = module.api_gateway.api_url
  environment       = var.environment
}

module "lambda" {
  source            = "./modules/lambda"
  runtime           = "nodejs18.x"
  api_execution_arn = module.api_gateway.api_execution_arn
  environment       = var.environment
}

module "api_gateway" {
  source                     = "./modules/api_gateway"
  region                     = var.aws_region
  lambda_function_invoke_arn = module.lambda.lambda_invoke_arn
  environment                = var.environment
}
