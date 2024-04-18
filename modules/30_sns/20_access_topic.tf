# resource "aws_sns_topic" "access-layer-topic" {
#   name = "${var.project}-access-topic-${var.env}"
#   display_name = "${var.project}-access-topic-${var.env}"
# }

resource "aws_sns_topic" "access-layer-topic" {
  name = "${var.project}-access-topic-${var.env}"
  display_name = "${var.project}-access-topic-${var.env}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Id": "Object-update-notification",
  "Statement": [
    {
      "Sid": "Example SNS topic policy",
      "Effect": "Allow",
      "Principal": {
        "Service": "s3.amazonaws.com"
      },
      "Action": "SNS:Publish",
      "Resource": "arn:aws:sns:${var.region}:${var.account_id}:${var.project}-access-topic-${var.env}",
      "Condition": {
        "StringEquals": {
          "aws:SourceAccount": "${var.account_id}"
        },
        "ArnLike": {
          "aws:SourceArn": "arn:aws:s3:::${var.project}-access-layer-bucket-${var.env}"
        }
      }
    }
  ]
}                 
EOF
}

resource "aws_sns_topic_subscription" "access-layer-topic-subscription" {
  topic_arn = aws_sns_topic.access-layer-topic.arn
  protocol  = "sqs"
  endpoint  = var.access_layer_queue_arn
}
