output "access_layer_queue_arn" {
    value = aws_sqs_queue.access-layer-queue.arn
    description = "sqs queue arn"
}
