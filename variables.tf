variable "uploads_bucket_name" {
  default = "uc18-image-uploads"
}

variable "processed_bucket_name" {
  default = "uc18-processed-images"
}

variable "lambda_function_name" {
  default = "uc18-image-processor"
}

variable "image_uri" {
  description = "ECR image URI for Lambda"
  type        = string
}

variable "lambda_execution_role_arn" {
  description = "IAM role ARN for Lambda"
  type        = string
}

variable "api_name" {
  default = "UC18ImageUploadAPI"
}

variable "queue_name" {
  default = "uc18-image-processing-queue"
}

variable "table_name" {
  default = "uc18-image-metadata"
}