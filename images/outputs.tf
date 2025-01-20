
output "image_ids" {
  description = "Map of image names to their IDs"
  value = {
    for k, v in proxmox_virtual_environment_download_file.images : k => v.id
  }
}
