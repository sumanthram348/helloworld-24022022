data "databricks_clusters" "all" {
}

data "databricks_dbfs_file_paths" "app" {
  path      = "dbfs:/FileStore/"
  recursive = false
}

resource "databricks_library" "app" {
  for_each   = data.databricks_clusters.all.ids
  cluster_id = each.key
  #cluster_id = data.databricks_clusters.all.id
  jar        = data.databricks_dbfs_file_paths.app.path
}

