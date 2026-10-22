terraform {
  required_version = ">= 1.10.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Sin llaves aquí: HCP Terraform entregará credenciales temporales (paso 4).
provider "aws" {
  region = var.region
}
