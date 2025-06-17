output "uploads_bucket" {
  value = module.s3.uploads_bucket_name
}

output "processed_bucket" {
  value = module.s3.processed_bucket_name
}

output "lambda_function_name" {
  value = module.lambda.lambda_function_name
}

output "api_endpoint" {
  value = module.api_gateway.api_endpoint
}

output "sqs_queue_url" {
  value = module.sqs.queue_url
}

output "dynamodb_table_name" {
  value = module.dynamodb.table_name
}

output "cloudwatch_log_group" {
  value = module.cloudwatch.log_group_name
}