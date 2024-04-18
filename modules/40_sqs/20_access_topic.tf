resource "aws_sqs_queue" "access-layer-queue" {
  name = "${var.project}-access-queue-${var.env}"
  visibility_timeout_seconds = 30
}

resource "aws_sqs_queue_policy" "example" {
  queue_url = aws_sqs_queue.access-layer-queue.url
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Id": "arn:aws:sqs:us-east-2:${var.account_id}:undefined/SQSDefaultPolicy",
  "Statement": [
    {
      "Sid": "topic-subscription-arn:aws:sns:us-east-2:${var.account_id}:${var.project}-access-topic-${var.env}",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "SQS:SendMessage",
      "Resource": "arn:aws:sqs:us-east-2:${var.account_id}:${var.project}-access-queue-${var.env}",
      "Condition": {
        "ArnLike": {
          "aws:SourceArn": "arn:aws:sns:us-east-2:${var.account_id}:${var.project}-access-topic-${var.env}"
        }
      }
    }
  ]
}
EOF
}