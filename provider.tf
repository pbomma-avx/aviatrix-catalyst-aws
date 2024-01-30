terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    aviatrix = {
      source  = "AviatrixSystems/aviatrix"
      version = "~> 3.1.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = ">=3.1.0"
    }
  }
}
