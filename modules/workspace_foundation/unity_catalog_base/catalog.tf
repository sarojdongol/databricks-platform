
resource "databricks_catalog" "catalog" {
  provider = databricks.second
  depends_on = [ databricks_metastore_assignment.default_metastore ]
  metastore_id = databricks_metastore.metastore.id
  name         = var.catalog_name
}