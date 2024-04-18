resource "aws_s3_bucket" "access-layer-bucket" {
  bucket = "${var.project}-access-layer-bucket-${var.env}"
}

resource "aws_s3_bucket_public_access_block" "access-layer-bucket-restriction" {
  bucket = aws_s3_bucket.access-layer-bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_notification" "access-layer-bucket-notification" {
  bucket = "${var.project}-access-layer-bucket-${var.env}"

  topic {
    topic_arn = "arn:aws:sns:${var.region}:${var.account_id}:${var.project}-access-topic-${var.env}"
    events    = ["s3:ObjectCreated:*"]
  }
}



# Define an object in s3 bucket

resource "aws_s3_object" "access-layer-object" {
  bucket = aws_s3_bucket.access-layer-bucket.id
  key    = "data"
  source = "./modules/20_s3/userdata1.parquet"
}
