module "terraform-state" {
    source = "./modules/10_terraform-state"
    
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

