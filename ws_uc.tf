module "workspace_unity_catalog" {
  source                                 = "./modules/workspace_foundation/workspace_base"
  databricks_account_username            = local.databricks_account_username
  databricks_account_password            = local.databricks_account_password
  databricks_account_id                  = local.databricks_account_id
  metastore_storage_label                = local.metastore_storage_label
  metastore_name                         = local.metastore_name
  metastore_label                        = local.metastore_label
  default_metastore_default_catalog_name = local.default_metastore_default_catalog_name
  aws_account_id                         = "443582877706"
  catalog_name                           = local.catalog_name
  providers = {
    databricks.main = databricks.mws
    databricks.ws = databricks.workspace
  }
}

/* module "uc" {
  source = "./modules/workspace_foundation/unity_catalog_base"
  depends_on = [module.workspace_unity_catalog]
  databricks_account_username = local.databricks_account_username
  databricks_account_password = local.databricks_account_password
  databricks_account_id = local.databricks_account_id
  metastore_storage_label     = local.metastore_storage_label
  metastore_name              = local.metastore_name
  metastore_label             = local.metastore_label
  default_metastore_default_catalog_name = local.default_metastore_default_catalog_name
  aws_account_id = "443582877706"
  catalog_name = local.catalog_name
  workspace_id = module.workspace_unity_catalog.databricks_workspace_id
} */