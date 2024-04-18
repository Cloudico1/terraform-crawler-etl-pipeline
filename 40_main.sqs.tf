module "sqs" {
    source = "./modules/40_sqs"
    
    # common variables

    project = var.project
    env = var.env
    account_id = var.account_id
    # raw_layer_bucket= var.raw_layer_bucket
    # access_layer_bucket= var.access_layer_bucket
    region= var.region
    # sns_topic_arn = module.sns.sns_topic_arn

    # providers

    providers = {
        aws.primary = aws.primary
    }
}
