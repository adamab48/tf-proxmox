resource "proxmox_virtual_environment_download_file" "alpine" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = "bigoi"
  url          = "https://dl-cdn.alpinelinux.org/alpine/v3.21/releases/x86_64/alpine-virt-3.21.2-x86_64.iso"
  verify       = false

  lifecycle {
    prevent_destroy = true
  }
}
