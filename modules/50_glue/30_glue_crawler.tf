resource "aws_glue_crawler" "crawler" {
  database_name = "${var.project}-crawler-database-${var.env}"
  name = "${var.project}-access-layer-crawler-${var.env}"
  role = aws_iam_role.access_layer_crawler_role.arn

  s3_target {
    path = "s3://${var.project}-access-layer-bucket-${var.env}/"
  }
  depends_on = [aws_iam_role.access_layer_crawler_role]
}