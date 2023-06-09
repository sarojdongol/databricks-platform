output "databricks_url" {
  value = module.workspace_unity_catalog.databricks_host
}

output "databricks_workspace_id" {
  value = module.workspace_unity_catalog.databricks_workspace_id
}

output "metastore_id" {
  value = module.workspace_unity_catalog.databricks_token
  sensitive = true
}