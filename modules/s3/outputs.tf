output "uploads_bucket_name" {
  value = aws_s3_bucket.uploads.bucket
}

output "processed_bucket_name" {
  value = aws_s3_bucket.processed.bucket
}