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
  name     = "demo-resources-oss"
  location = "West Europe"
}

resource "azurerm_service_plan" "example" {
  name                = "demo-sp"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  os_type             = "Linux"
  sku_name            = "S1"
}


resource "azurerm_linux_web_app" "example" {
  name                = "demo-example-azure"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  service_plan_id     = azurerm_service_plan.example.id
  tags                = ["armin-demo"]

  site_config {
    application_stack {
      python_version = var.python_version
    }
  }
}
