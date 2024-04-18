module "glue" {
    source = "./modules/50_glue"
    
    # common variables

    project = var.project
    env = var.env
    account_id = var.account_id
    region= var.region
    # glue_catalog_database= var.glue_catalog_database

    # providers

    providers = {
        aws.primary = aws.primary
    }
}
