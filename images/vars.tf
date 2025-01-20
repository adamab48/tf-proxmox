# variables.tf
variable "node_name" {
  description = "Name of the Proxmox node"
  type        = string
  default     = "bigoi"
}

variable "datastore_id" {
  description = "ID of the datastore"
  type        = string
  default     = "local"
}

variable "images" {
  description = "Map of images to download"

  type = map(object({
    url          = string
    content_type = string
  }))
  default = {
    alpine = {
      url          = "https://dl-cdn.alpinelinux.org/alpine/v3.21/releases/x86_64/alpine-virt-3.21.2-x86_64.iso"
      content_type = "iso"
    }
    ubuntu24 = {
      url          = "http://cloud-images.ubuntu.com/releases/24.04/release/ubuntu-24.04-server-cloudimg-amd64.img"
      content_type = "iso"
    }
    #ubuntu22 = {
    #  url          = "https://cloud-images.ubuntu.com/releases/22.04/release/ubuntu-22.04-server-cloudimg-amd64.img"
    #  content_type = "iso"
    #}
    #ubuntu20 = {
    #  url          = "https://cloud-images.ubuntu.com/releases/20.04/release/ubuntu-20.04-server-cloudimg-amd64.img"
    #  content_type = "iso"
    #}
  }
}
