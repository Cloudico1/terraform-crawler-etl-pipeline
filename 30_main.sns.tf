module "sns" {
    source = "./modules/30_sns"
    depends_on = [ module.s3 ]
    
    # common variables

    project = var.project
    env = var.env
    account_id = var.account_id
    region= var.region
    access_layer_queue_arn = module.sqs.access_layer_queue_arn

    # providers

    providers = {
        aws.primary = aws.primary
    }
}
