output "databricks_host" {
  value = databricks_mws_workspaces.this.workspace_url
}

output "databricks_workspace_id" {
  value = databricks_mws_workspaces.this.workspace_id
}

output "metastore_id" {
  value     = module.uc.metastore_id
  sensitive = true
} 