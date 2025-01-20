# variables.tf
variable "common_config" {
  description = "Common configuration for all VMs"
  type = object({
    node_name    = string
    username     = string
    pubkey       = string
    datastore_id = string
    disk_size    = number
    on           = bool
    bridge       = string
  })
  default = {
    node_name    = "bigoi"
    username     = "bi"
    pubkey       = "" # Will be set in the main configuration
    datastore_id = "local-lvm"
    disk_size    = 30
    on           = true
    bridge       = "vmbr0"
  }
}

variable "vms" {
  description = "Configuration for different VMs"
  type = map(object({
    memory_gb = optional(number, 1)
    tags      = list(string)
    image_key = string
  }))
  default = {
    alpine = {
      image_key = "alpine"
      tags      = ["terraform", "alpine", "test"]
    }
    ubuntu24 = {
      memory_gb = 2
      image_key = "ubuntu24"
      tags      = ["terraform", "ubuntu", "test"]
    }
  }
}
