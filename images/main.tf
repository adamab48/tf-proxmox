


resource "proxmox_virtual_environment_download_file" "images" {
  for_each = var.images

  content_type   = each.value.content_type
  datastore_id   = var.datastore_id
  node_name      = var.node_name
  url            = each.value.url
  upload_timeout = "3600"
  verify         = false
  overwrite      = false
}

# outputs.tf

