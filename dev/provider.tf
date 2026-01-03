terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.57.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rgtinda"
    storage_account_name = "stgtinda3" # <- use module output
    container_name       = "tinda"
    key                  = "envs/dev/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "86c2c7ab-0841-425a-9004-95c83c2075de"
}