

provider "aws" {
  region = "ap-southeast-2"
}

// initialize provider in "MWS" mode for account-level resources
provider "databricks" {
  alias      = "mws"
  host       = "https://accounts.cloud.databricks.com"
  account_id = var.databricks_account_id
  username   = var.databricks_account_username
  password   = var.databricks_account_password
}

// initialize provider at workspace level, to create UC resources
provider "databricks" {
  alias = "workspace"
  host  = module.workspace_unity_catalog.databricks_host
  token = module.workspace_unity_catalog.databricks_token
}

terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "1.17.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "4.67.0"

    }
  }

  cloud {
    organization = "sarojdongol"

    workspaces {
      name = "databricksp-sarojdongol-stg"
    }
  }
}
