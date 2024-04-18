resource "aws_athena_named_query" "crawler_query" {
  name  = "crawler_query"
  query = <<QUERY
  SELECT * FROM "AwsDataCatalog"."project-2-processing-crawler-database-dev"."project_2_processing_access_layer_bucket_dev" limit 10;
  QUERY
  workgroup = "primary"
  result_config {
    output_location = "s3://${var.project}-access-layer-crawler-result-${var.env}/crawler/results/"
  }
}