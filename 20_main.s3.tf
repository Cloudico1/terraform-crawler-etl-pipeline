module "s3" {
    source = "./modules/20_s3"
    
    # common variables

    project = var.project
    env = var.env
    account_id = var.account_id
    region= var.region

    # providers

    providers = {
        aws.primary = aws.primary
    }
}
