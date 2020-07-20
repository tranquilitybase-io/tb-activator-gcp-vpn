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
1) Create VPN Gateway on right side of the connection either through GCP console or using this module.
2) Generate terraform.tfvars file in the root folder. This file should assign values to the variables declared in variables.tf
3) run `terraform apply` to apply the infrastructure build

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

When making use of the module the following commands should be used in the appropriate folders::

- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build
- `terraform destroy` to destroy the built infrastructure

## Inputs
| Name               | Description                                                                                                                                                         |  Type  | Default | Required |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :----: | :-----: | :------: |
| project_id         | The ID of the project where this VPC will be created                                                                                                                | string |    -    |   yes    |
| network            | The name of the network being created                                                                                                                               | string |    -    |   yes    |
| region             | The region where the gateway and tunnels are going to be created                                                                                                    | string |    -    |   yes    |
| gateway_name       | The name of the VPN gateway being created                                                                                                                           |  list  |    -    |   yes    |
| tunnel_name_prefix | The prefix used for the tunnel names. If more than one tunnel_count is specified, the tunnel_count is appended to the end of the tunnel prefix                      | string |    -    |   yes    |
| tunnel_count       | The amount of tunnels attached to this gateway                                                                                                                      |  int   |    1    |    no    |
| peer_ips           | List of peer IP's to use, needs a peer IP for each tunnel in tunnel_count. The first peer IP attaches to tunnel #1, second peer IP attaches to tunnel #2, and so on |  list  |    -    |   yes    |
| ike_version        | Sets the IKE version to use with the tnnels. Defaults to IKEv2                                                                                                      |  int   |    2    |    no    |





