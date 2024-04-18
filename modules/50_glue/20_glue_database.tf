resource "aws_glue_catalog_database" "catalog_database" {
  name = "${var.project}-crawler-database-${var.env}"

  create_table_default_permission {
        permissions = [
            "ALL",
        ]
        principal {
            data_lake_principal_identifier = "IAM_ALLOWED_PRINCIPALS"
        }
    }
}

# Define a resource for the Glue Catalog Table with the name "${var.project}-crawler-database-${var.env}" for database "${var.project}-crawler-database-${var.env}" and target s3 bucket ${var.project}-access-layer-crawler-result-${var.env} with parquet as the data format.

resource "aws_glue_catalog_table" "catalog_table" {
  name = "${var.project}-crawler-table-${var.env}"
  database_name = "${var.project}-crawler-database-${var.env}"
#   classification = "parquet"

  storage_descriptor {
    location = "s3://${var.project}-access-layer-crawler-result-${var.env}/"
    input_format = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat"
    output_format = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat"
    compressed = false
    parameters = {
      "serialization.format" = "1"
    }
    ser_de_info {
      serialization_library = "org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe"
    }

    # stored_as_sub_directories = false
  }
    depends_on  = [aws_glue_catalog_database.catalog_database]
}