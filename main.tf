resource "proxmox_virtual_environment_download_file" "alpine" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = "bigoi"
  url          = "https://dl-cdn.alpinelinux.org/alpine/v3.21/releases/x86_64/alpine-virt-3.21.2-x86_64.iso"
  verify       = false
}

resource "proxmox_virtual_environment_download_file" "ubuntu_24" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = "bigoi"
  url          = "https://cloud-images.ubuntu.com/releases/24.04/release/ubuntu-24.04-server-cloudimg-amd64.img"
  verify       = false
}

