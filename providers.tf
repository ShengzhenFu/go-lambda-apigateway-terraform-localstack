provider "aws" {
  profile                     = "localstack"
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true


  endpoints {
    apigatewayv2 = "http://localhost:4566"
    apigateway   = "http://localhost:4566"
    s3           = "http://localhost:4566"
    lambda       = "http://localhost:4566"
    iam          = "http://localhost:4566"
    cloudwatch   = "http://localhost:4566"
    sts          = "http://localhost:4566"
  }
  default_tags {
    tags = {
      Environment = "Local"
      Service     = "LocalStack"
    }
  }
}


terraform {
  required_version = "= 1.5.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.35.0"
    }
  }
}
