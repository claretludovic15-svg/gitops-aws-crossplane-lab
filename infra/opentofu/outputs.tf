output "foundation_bucket_name" {
  description = "Name of the OpenTofu-managed foundation bucket"
  value       = aws_s3_bucket.foundation_audit.bucket
}
