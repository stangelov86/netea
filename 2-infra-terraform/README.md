# Terraform Infrastructure as a Code


## Deployment Instructions

### Initialize Terraform
Run the following command to initialize the Terraform environment and download necessary providers:
```bash
terraform init
```

### Deploy the Infrastructure
Apply the Terraform plan to create the infrastructure:
```bash
terraform apply -var="bucket_name=<your-bucket-name>" -var="aws_region=<your-region>" -var="aws_access_key=<your-aws-access-key>" -var="aws_secret_key=<your-aws-secret-key>"
```

### Destroy the Infrastructure
Run the following command to destroy created infrastructure:
```bash
terraform destroy -var="bucket_name=<your-bucket-name>" -var="aws_region=<your-region>" -var="aws_access_key=<your-aws-access-key>" -var="aws_secret_key=<your-aws-secret-key>"
```

## Examle of Terraform Outputs
```bash
api_gateway_url = "https://92hsh5o1jh.execute-api.us-west-1.amazonaws.com/dev/api/lambda"
cdn_api_url = "d2g0ngh6ei8xyj.cloudfront.net/api/lambda"
cdn_distribution_domain = "d2g0ngh6ei8xyj.cloudfront.net"
```