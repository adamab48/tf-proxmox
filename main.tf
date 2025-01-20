module "images" {
  source = "./images"
}

module "test-vm" {
  source           = "./vm"
  node_name        = "bigoi"
  username         = "test"
  datastore_id     = "local-lvm"
  disk_size        = 30
  hostname         = "vm-test"
  tags             = ["terraform", "ubuntu", "test"]
  on               = true
  bridge           = "vmbr0"
  template_file_id = module.images.alpine.id
}
