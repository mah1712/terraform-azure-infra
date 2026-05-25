module "rg" {
    source = "../../modules/resource-group"
     rg = var.rg
     tags = local.tags
}

module "vnet" {
  source = "../../modules/network/vnet"
  depends_on = [ module.rg ]
  vnet = var.vnet
  tags = local.tags
}
module "subnet" {
  source = "../../modules/network/subnet"
  depends_on = [ module.vnet ]
  subnet = var.subnet
}

module "nsg" {
  source = "../../modules/network/nsg"
  depends_on = [ module.rg ]

  nsg = var.nsg

}

module "pip" {
  source = "../../modules/network/public-ip"
  depends_on = [ module.rg ]
  pip = var.pip
}

module "nic" {

  source = "../../modules/compute/nic"

  depends_on = [ module.subnet ]

  subnet_data = var.subnet_data
  nic         = var.nic
}
module "keyvault" {

  source = "../../modules/security/keyvault"

  depends_on = [ module.rg ]

  keyvault = var.keyvault

  secret = var.secret
}

module "vm" {

  source = "../../modules/compute/virtual-machine"

  depends_on = [module.nic, module.keyvault]

  nic_data = var.nic_data

  keyvault_data = var.keyvault_data

  username_secret = var.username_secret

  password_secret = var.password_secret

  vm = var.vm
}

module "bastion" {

  source = "../../modules/network/bastion"

  depends_on = [module.subnet, module.pip ]

  bastion = var.bastion
}

module "lb" {

  source = "../../modules/loadbalancer"

  depends_on = [module.nic,module.subnet]

  lb = var.lb

  lb_nic_data = var.lb_nic_data
}

module "nat_gateway" {

  source = "../../modules/network/nat-gateway"

  depends_on = [module.subnet, module.pip]

  nat_pip_data = var.nat_pip_data

  nat_subnet_data = var.nat_subnet_data

  nat_gateway = var.nat_gateway
}

module "storage_account" {

  source = "../../modules/storage-account"

  depends_on = [ module.rg ]

  storage_account = var.storage_account
}

module "nsg_association" {

  source = "../../modules/network/nsg-association"

  depends_on = [module.subnet, module.nsg]

  nsg_subnet_data = var.nsg_subnet_data
}

module "private_dns" {

  source = "../../modules/security/private-dns"

  depends_on = [module.vnet]

  private_dns = var.private_dns
}

module "private_endpoint" {

  source = "../../modules/security/private-endpoint"

  depends_on = [module.private_dns, module.keyvault]

  private_endpoint = var.private_endpoint
}

module "firewall" {

  source = "../../modules/network/firewall"

  depends_on = [module.subnet, module.pip]

  firewall = var.firewall
}

module "udr" {

  source = "../../modules/network/udr"

  depends_on = [module.firewall, module.subnet]

  udr = var.udr
}

module "log_analytics" {

  source = "../../modules/monitoring/log-analytics"

  depends_on = [module.rg]

  log_analytics = var.log_analytics
}

module "alert" {

  source = "../../modules/monitoring/alert"

  depends_on = [module.vm]

  alert = {

    vm1_alert = merge(
      var.alert["vm1_alert"],
      {
        vm_id = module.vm.vm_id["vm1"]
      }
    )

    vm2_alert = merge(
      var.alert["vm2_alert"],
      {
        vm_id = module.vm.vm_id["vm2"]
      }
    )
  }
}