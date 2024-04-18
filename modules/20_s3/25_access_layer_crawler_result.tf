resource "aws_s3_bucket" "access-layer-crawler-result" {
  bucket = "${var.project}-access-layer-crawler-result-${var.env}"
}

resource "aws_s3_bucket_public_access_block" "access-layer-crawler-result-restriction" {
  bucket = aws_s3_bucket.access-layer-crawler-result.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}