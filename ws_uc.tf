module "workspace_unity_catalog" {
    source = "./modules/workspace_foundation/workspace_base"
    databricks_account_username = var.databricks_account_username
    databricks_account_password = var.databricks_account_password
    databricks_account_id       = var.databricks_account_id
    metastore_storage_label     = var.metastore_storage_label
    metastore_name              = var.metastore_name
    metastore_label             = var.metastore_label
    default_metastore_default_catalog_name = var.default_metastore_default_catalog_name
    aws_account_id = "443582877706"
    catalog_name = var.catalog_name
    

}