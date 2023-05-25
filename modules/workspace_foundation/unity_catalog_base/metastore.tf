resource "databricks_metastore" "metastore" {
  provider = databricks.second
  name          = var.metastore_name
  storage_root  = "s3://${aws_s3_bucket.metastore.id}/${var.metastore_label}"
  force_destroy = true
}

resource "databricks_metastore_data_access" "metastore_data_access" {
  depends_on   = [ databricks_metastore.default_metastore ]
  provider = databricks.second
  metastore_id = databricks_metastore.metastore.id
  name         = aws_iam_role.metastore_data_access.name
  aws_iam_role { role_arn = aws_iam_role.metastore_data_access.arn }
  is_default   = true
}

resource "databricks_metastore_assignment" "default_metastore" {
  provider = databricks.second
  workspace_id         = var.workspace_id
  metastore_id         = databricks_metastore.metastore.id
}