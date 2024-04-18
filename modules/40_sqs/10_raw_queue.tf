# resource "aws_sqs_queue" "raw-layer-queue" {
#   name = "${var.project}-raw-queue-${var.env}"
#   visibility_timeout_seconds = 30
# }

# # resource "aws_sqs_queue_subscription" "raw-layer-queue-subscription" {
# #   queue_url      = aws_sqs_queue.raw-layer-queue.id
# #   topic_arn      = var.sns_topic_arn
# #   delivery_policy = jsonencode({
# #     "healthyRetryPolicy" : {
# #       "minDelayTarget" : 20,
# #       "maxDelayTarget" : 20,
# #       "numRetries" : 3,
# #       "numMaxDelayRetries" : 3,
# #       "numNoDelayRetries" : 3,
# #       "numMinDelayRetries" : 3
# #     }
# #   })
# # }