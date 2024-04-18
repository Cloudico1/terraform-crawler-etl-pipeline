resource "aws_iam_policy" "crawler_s3_access_policy" {
  name = "crawler_s3_access_policy"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetObject",
                "s3:PutObject"
            ],
            "Resource": [
                "arn:aws:s3:::${var.project}-access-layer-bucket-${var.env}/*"
            ]
        }
    ]
}
EOF
}
resource "aws_iam_policy_attachment" "access_crawler_policy_attachment" {
  name = "access_crawler_policy_attachment"
  roles = [aws_iam_role.access_layer_crawler_role.name]
  policy_arn = aws_iam_policy.crawler_s3_access_policy.arn

  depends_on = [
    aws_iam_role.access_layer_crawler_role
  ]
}
resource "aws_iam_policy_attachment" "access_crawler_policy_attachment_2" {
  name = "access_crawler_policy_attachment_2"
  roles = [aws_iam_role.access_layer_crawler_role.name]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"

  depends_on = [aws_iam_role.access_layer_crawler_role]
}

