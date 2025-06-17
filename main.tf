provider "aws" {
  region = "us-east-1"
}

module "s3" {
  source                = "./modules/s3"
  uploads_bucket_name   = var.uploads_bucket_name
  processed_bucket_name = var.processed_bucket_name
}

module "lambda" {
  source                    = "./modules/lambda"
  lambda_function_name      = var.lambda_function_name
  image_uri                 = var.image_uri
  lambda_execution_role_arn = var.lambda_execution_role_arn
  uploads_bucket            = module.s3.uploads_bucket_name
  processed_bucket          = module.s3.processed_bucket_name
}

module "api_gateway" {
  source            = "./modules/api_gateway"
  api_name          = var.api_name
  lambda_invoke_arn = var.lambda_execution_role_arn
}

module "sqs" {
  source     = "./modules/sqs"
  queue_name = var.queue_name
}

module "dynamodb" {
  source     = "./modules/dynamodb"
  table_name = var.table_name
}

module "cloudwatch" {
  source               = "./modules/cloudwatch"
  lambda_function_name = var.lambda_function_name
}