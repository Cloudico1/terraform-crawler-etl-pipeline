{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowGlueCrawlerAccessToSQS",
      "Effect": "Allow",
      "Action": [
        "sqs:ReceiveMessage",
        "sqs:DeleteMessage"
      ],
      "Resource": "arn:aws:sqs:REGION:ACCOUNT_ID:QUEUE_NAME"
    }
  ]
}