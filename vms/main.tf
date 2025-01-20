module "images" {
  source = "../images"
}

locals {
  vm_config = merge(var.common_config, {
    pubkey = file("~/.ssh/id_ed25519.pub")
  })
}

module "vms" {
  source   = "../vm"
  for_each = var.vms

  # Common configuration
  node_name    = local.vm_config.node_name
  username     = local.vm_config.username
  pubkey       = local.vm_config.pubkey
  datastore_id = local.vm_config.datastore_id
  disk_size    = local.vm_config.disk_size
  on           = local.vm_config.on
  bridge       = local.vm_config.bridge

  # VM-specific configuration
  memory_gb        = each.value.memory_gb
  hostname         = "vm-${each.key}"
  tags             = each.value.tags
  template_file_id = module.images.image_ids[each.value.image_key]
}
