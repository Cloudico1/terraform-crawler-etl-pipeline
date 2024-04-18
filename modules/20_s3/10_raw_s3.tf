resource "aws_s3_bucket" "raw-layer-bucket" {
  bucket = "${var.project}-raw-layer-bucket-${var.env}"
}

resource "aws_s3_bucket_public_access_block" "raw-layer-bucket-restriction" {
  bucket = aws_s3_bucket.raw-layer-bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

output "raw-layer-bucket-arn" {
  value = aws_s3_bucket.raw-layer-bucket.arn
}
