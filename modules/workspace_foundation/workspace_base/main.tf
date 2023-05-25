terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "1.17.0"
      configuration_aliases = [databricks.main, databricks.ws]
    }
    aws = {
      source  = "hashicorp/aws"
      version = "4.67.0"

    }
  }
}

resource "random_string" "naming" {
  special = false
  upper   = false
  length  = 6
}

locals {
  prefix = "demo-${random_string.naming.result}"
  tags   = {}
}

provider "databricks" {
  alias = "test"
  host = databricks_mws_workspaces.this.workspace_url
  token = databricks_mws_workspaces.this.token[0].token_value
}

 module "uc" {
  source = "../unity_catalog_base"
  databricks_account_username = var.databricks_account_username
  databricks_account_password = var.databricks_account_password
  databricks_account_id = var.databricks_account_id
  metastore_storage_label     = var.metastore_storage_label
  metastore_name              = var.metastore_name
  metastore_label             = var.metastore_label
  default_metastore_default_catalog_name = var.default_metastore_default_catalog_name
  aws_account_id = "443582877706"
  catalog_name = var.catalog_name
  workspace_id = databricks_mws_workspaces.this.workspace_id
  token = databricks_mws_workspaces.this.token[0].token_value
  workspace_url = databricks_mws_workspaces.this.workspace_url
  providers = {
    databricks.second = databricks.test
  }
}