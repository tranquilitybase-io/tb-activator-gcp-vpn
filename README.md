# Terraform Google Cloud Platform - GCP HA VPN Module

A Terraform module for creating HA VPN connection between 2 GCP networks.

This modules makes it easy to set up VPN connectivity in GCP by defining your gateways and tunnels.

It supports creating:

- A Google VPN Gateway
- Tunnels connecting the gateway to defined GCP peer
- Dynamic routes with cloud router

## Compatibility

This module is meant for use with Terraform >=0.12.

## Usage

This module can be used to create the vpn gateways, tunnels etc on both sides of the connection or just the left side. 

If using the module to create just the left side of the connection then it can be done in the following manner:
1) Generate terraform.tfvars file in the root folder. This file should assign values to the variables declared in variables.tf
2) run `terraform apply` to apply the infrastructure build

An example of how the terraform.tfvars file should look:

```hcl

```

You can go to the examples folder, however the usage of the module could be like this in your own main.tf file:



