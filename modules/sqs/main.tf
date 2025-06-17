resource "aws_sqs_queue" "image_processing_queue" {
  name                      = var.queue_name
  visibility_timeout_seconds = 120
  message_retention_seconds  = 86400
}