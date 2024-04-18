resource "aws_s3_bucket" "terraform_state" {
    provider = aws.primary
    lifecycle {
        prevent_destroy = true
    }
    bucket = "${var.project}-${var.env}-terraform-state"

    tags = {
        project = var.project
        managed_by = "terraform"
    }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption_terraform_state" {
    provider = aws.primary
    depends_on = [
        aws_s3_bucket.terraform_state
    ]
    lifecycle {
        prevent_destroy = true
    }
    bucket = aws_s3_bucket.terraform_state.bucket
    rule {
        apply_server_side_encryption_by_default {
            sse_algorithm = "AES256"
        }
    }
}

resource "aws_s3_bucket_versioning" "versioning_terraform_state" {
    provider = aws.primary
    depends_on = [
        aws_s3_bucket.terraform_state
    ]
    lifecycle {
        prevent_destroy = true
    }
    bucket = aws_s3_bucket.terraform_state.bucket
    versioning_configuration {
        status = "Enabled"
    }
}

resource "aws_s3_bucket_acl" "acl_terraform_state" {
    provider = aws.primary
    depends_on = [
        aws_s3_bucket.terraform_state
    ]
    lifecycle {
        prevent_destroy = true
    }
    bucket = aws_s3_bucket.terraform_state.bucket
    acl = "private"
}

resource "aws_s3_bucket_public_access_block" "public_access_terraform_state" {
    provider = aws.primary
    depends_on = [
        aws_s3_bucket.terraform_state
    ]
    lifecycle {
        prevent_destroy = true
    }
    bucket = aws_s3_bucket.terraform_state.bucket
    block_public_acls = true
    block_public_policy = true
    ignore_public_acls = true
    restrict_public_buckets = true
}
