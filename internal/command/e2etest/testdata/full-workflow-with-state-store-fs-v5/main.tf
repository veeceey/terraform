terraform {
  required_providers {
    simple5 = {
      source = "registry.terraform.io/hashicorp/simple5"
    }
  }

  state_store "simple5_fs" {
    provider "simple5" {}

    workspace_dir = "states"
  }
}

variable "name" {
  default = "world"
}

resource "terraform_data" "my-data" {
  input = "hello ${var.name}"
}

output "greeting" {
  value = resource.terraform_data.my-data.output
}
