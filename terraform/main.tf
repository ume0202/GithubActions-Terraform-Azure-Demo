terraform {
  backend "azurerm" {
    resource_group_name  = "GithubTerraformAzureDemo2"
    storage_account_name = "gaterraformdemo2"
    container_name       = "tfsfile"
    key                  = "dev.terraform.tfstate"
  }
}
module "RG" {
  source   = "./modules/RG" #A
  rgname   = var.rgname     #B
  location = var.location
}
module "SA" {
  source   = "./modules/StorageAccount"
  sname    = var.sname
  rgname   = var.rgname
  location = var.location
}