// Set up the Databricks workspace to use the E2 version of the Databricks on AWS platform.
// See https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/mws_workspaces
resource "databricks_mws_workspaces" "this" {
  provider = databricks.main
  account_id     = var.databricks_account_id
  aws_region     = var.region
  workspace_name = "sarojdongol-stg"
  #deployment_name = "sarojdongol-stg"
  credentials_id           = databricks_mws_credentials.this.credentials_id
  storage_configuration_id = databricks_mws_storage_configurations.this.storage_configuration_id
  network_id               = databricks_mws_networks.this.network_id
  token {
    comment = "Terraform"
  }
}

output "databricks_token" {
  value     = databricks_mws_workspaces.this.token[0].token_value
  sensitive = true
}
