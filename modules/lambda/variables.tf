variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "image_uri" {
  description = "URI of the Docker image in ECR"
  type        = string
}

variable "lambda_execution_role_arn" {
  description = "IAM role ARN for Lambda execution"
  type        = string
}

variable "uploads_bucket" {
  description = "S3 bucket name for uploaded images"
  type        = string
}

variable "processed_bucket" {
  description = "S3 bucket name for processed images"
  type        = string
}