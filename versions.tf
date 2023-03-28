terraform {
  required_version = ">= 1.3.0"

  required_providers {
    cloudfoundry = {
      source  = "cloudfoundry-community/cloudfoundry"
      version = ">= 0.50.5"
    }
    random = {
      source  = "random"
      version = ">= 3.4.0"
    }
  }
}
