# resource "aws_dynamodb_table" "terraform_locks" {
#     provider = aws.primary
#     lifecycle {
#         prevent_destroy = true
#     }
#     name         = "terraform_locks"
#     billing_mode = "PAY_PER_REQUEST"
#     hash_key     = "LockID"
#     attribute {
#         name = "LockID"
#         type = "S"
#     }

#     tags = {
#         project = var.project
#         managed_by = "terraform"
#     }
# }
