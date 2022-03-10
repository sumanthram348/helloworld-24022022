terraform {
  required_providers {
    databricks = {
      source  = "databrickslabs/databricks"
      version = "0.4.7"
    }
  }
}

provider "databricks" {
  host = "${var.host_name}"
  token = "'{var.token}"
}

