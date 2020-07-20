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
| gcp_project_id         | The ID of the project for where the VPN Gateway is created. ID of the project that is on the left side of the connection                                                                                                                | string |    -    |   yes    |
| gcp_vpc            | The name of the network for which the resource belongs to                                                                                                                               | string |    -    |   yes    |
| gcp_region             | The region for which the resource will be located in                                                                                                    | string |    -    |   yes    |
| cloud_router       | The name of the cloud router which is responsible for routes to be exchanged dynamically                                                                                                                           |  string  |    -    |   yes    |
| vpn_gw | The VPN Gateway for the left side of the connection                      | string |    -    |   yes    |
| secret_one       | The secret for the first tunnel                                                                                                                      |  string   |    -    |    yes    |
| secret_two           | The secret for the second tunnel |  string  |    -    |   yes    |
| tunnel0        | The tunnel that will be connected to interface 0 on the VPN Gateways                                                                                                      |  string   |    -    |    yes    |
| tunnel1        | The tunnel that will be connected to interface 1 on the VPN Gateways                                                                                                      |  string   |    -    |    yes    |
| gcp_asn        | The private asn that is used for all BGP sessions managed by the cloud router on the left side of the connection                                                                                                      |  string   |    -    |    yes    |
| router1_int0        | The name of the cloud router interface on interface 0                                                                                                      |  string   |    -    |    yes    |
| router1_int1        | The name of the cloud router interface on interface 1                                                                                                      |  string   |    -    |    yes    |
| router1_inside0        | BGP IP address for the tunnel on interface 0                                                                                                      |  string   |    -    |    yes    |
| router1_inside1        | BGP IP address for the tunnel on interface 1                                                                                                      |  string   |    -    |    yes    |
| bgp_peer_1        | Name of BGP peer on interface 0                                                                                                      |  string   |    -    |    yes    |
| bgp_peer_2        | Name of BGP peer on interface 1                                                                                                      |  string   |    -    |    yes    |
| router1_peer1        | BGP peer IP address for the tunnel on interface 0                                                                                                      |  string   |    -    |    yes    |
| router1_peer2        | BGP IP address for the tunnel on interface 1                                                                                                      |  string   |    -    |    yes    |
| gcp_asn_two        | ASN used by the peer VPN Gateway                                                                                                      |  string   |    -    |    yes    |
| peer_project_id        | The ID of the project for where the peer VPN Gateway is created. ID of the project that is on the right side of the connection                                                                                                      |  string   |    -    |    yes    |
| peer_gateway        | The peer VPN Gateway for the right side of the connection                                                                                                      |  string   |    -    |    yes    |

## Outputs

| Name | Description |
|------|-------------|
| vpn_one_interface_0_ip_address | The IP address associated with interface 0 of the left VPN Gateway |
| vpn_one_interface_1_ip_address | The IP address associated with interface 1 of the left VPN Gateway |

### Configure a Service Account
In order to utilise this module you must have a Service Account with the following roles:
- roles/compute.networkAdmin on the organization
You must also have the following permission on the project where the peer gateway is located in order to interact with it:
- compute.vpngateways.use


### Enable API's
In order to operate with the Service Account you must activate the following API on the project where the Service Account was created:
- Compute Engine API - compute.googleapis.com

## Development
### File structure
The project has the following folders and files:

- /: root folder
- /example: example for using this module
- /main.tf: calling module, calls the vpn module
- /output.tf: the outputs of the module
- /variables.tf: all the variables for the module
- /vpn: module that is responsible for the setup of the vpn
- /README.md: this file





