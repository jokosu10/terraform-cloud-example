terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 5.0"
        }
    }

    cloud {
        organization = "jokosu10_labs"

        workspaces {
            name = "demo-terraform-cloud"
        }
    }

    required_version = ">= 1.2.0"
}

provider "aws" {
    region     = var.region
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
}