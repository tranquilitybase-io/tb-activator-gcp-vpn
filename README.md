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
  cloud_router = "tranquility-router"

  gcp_vpc = "main-one"

  gcp_asn = "64513"

  gcp_region = "europe-west2"

  vpn_gw = "vpn-gw-1"

  tunnel0 = "tunnel-1"

  peer_gateway = "vpn-gw-2"

  peer_project_id = "vpn-two"

  tunnel1 = "tunnel-2"

  router1_int0 = "router-1-interface-name-0"

  router1_inside0 = "169.254.6.1/30"

  router1_int1 = "router-1-interface-name-1"

  router1_inside1 = "169.254.7.1/30"

  bgp_peer_1 = "peer-1"

  gcp_asn_two = "64514"

  router1_peer1 = "169.254.6.2"

  bgp_peer_2 = "peer-2"

  router1_peer2 = "169.254.7.2"

  gcp_project_id = "vpn-one"
```

If using the module to deploying both sides of the connection then refer to the example folder. The example folder demonstrates a use of the module to creating both sides of the connection. 





