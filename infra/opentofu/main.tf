resource "aws_s3_bucket" "foundation_audit" {
  #checkov:skip=CKV_AWS_144:Cross-region replication not required for lab foundation bucket
  #checkov:skip=CKV_AWS_18:Access logging not required for single-bucket foundation demo
  #checkov:skip=CKV2_AWS_62:Event notifications not required for foundation bucket
  #checkov:skip=CKV_AWS_145:Default AES256 encryption used instead of custom KMS key for lab
  bucket = "${var.project_name}-foundation-audit"

  tags = {
    Project   = var.project_name
    ManagedBy = "OpenTofu"
    Purpose   = "FoundationBootstrap"
  }
}

resource "aws_s3_bucket_versioning" "foundation_audit" {
  bucket = aws_s3_bucket.foundation_audit.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "foundation_audit" {
  bucket = aws_s3_bucket.foundation_audit.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "foundation_audit" {
  bucket = aws_s3_bucket.foundation_audit.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
