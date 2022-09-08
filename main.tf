# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  cloud {
    organization = "armin-mesic"

    workspaces {
      name = "azure-infra-dev"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
  subscription_id         = var.ARM_SUBSCRIPTION_ID
  tenant_id               = var.ARM_TENANT_ID
  client_id               = var.ARM_CLIENT_ID
  client_secret           = var.ARM_CLIENT_SECRET
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources-5"
  location = "West Europe"
}
