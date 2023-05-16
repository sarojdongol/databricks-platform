variable "databricks_account_username" {}
variable "databricks_account_password" {}
variable "databricks_account_id" {}
variable "aws_account_id" {}


variable "tags" {
  default = {}
}

variable "cidr_block" {
  default = "10.4.0.0/16"
}

variable "region" {
  default = "ap-southeast-2"
}
variable "catalog_name" {}
variable "metastore_storage_label" {}
variable "metastore_name" {}
variable "metastore_label" {}
variable "default_metastore_default_catalog_name" {}


