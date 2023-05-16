
terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "1.0.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "4.41.0"
    }
  }
}

provider "aws" {
  region = var.region
}


provider "databricks" {
  alias    = "mws"
  host     = "https://accounts.cloud.databricks.com"
  username = var.databricks_account_username
  password = var.databricks_account_password
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
}