{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "SNS topic policy",
            "Effect": "Allow",
            "Principal": {
                "Service": "s3.amazonaws.com"
            },
            "Action": [
                "SNS:Publish"
            ],
            "Resource": "arn:aws:sns:us-east-2:12345678:project-topic-dev",
            "Condition": {
                "ArnLike": {
                    "aws:SourceArn": "arn:aws:s3:::project-s3-dev-1"
                },
                "StringEquals": {
                    "aws:SourceAccount": "12345678"
                }
            }
        }
    ]
}                  