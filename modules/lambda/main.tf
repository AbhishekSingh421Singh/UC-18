resource "aws_lambda_function" "image_processor" {
  function_name = var.lambda_function_name
  package_type  = "Image"
  image_uri     = var.image_uri
  role          = var.lambda_execution_role_arn
  timeout       = 60
  memory_size   = 1024

  environment {
    variables = {
      UPLOADS_BUCKET   = var.uploads_bucket
      PROCESSED_BUCKET = var.processed_bucket
    }
  }
}