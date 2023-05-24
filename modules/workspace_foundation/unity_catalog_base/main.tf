
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