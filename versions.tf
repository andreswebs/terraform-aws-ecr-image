terraform {
  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.50"
    }

    external = {
      source  = "hashicorp/external"
      version = "~> 2.3"
    }

    null = {
      source  = "hashicorp/null"
      version = "~> 3.2"
    }

  }
}