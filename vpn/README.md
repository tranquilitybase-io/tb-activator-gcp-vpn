# Google Cloud HA VPN Module
This module is responsible for deploying all of the infrastructure required for the setup of a GCP-GCP HA VPN.

An example use of this module to create the left side of a connection and to create both sides of a connection can be found below:

## Examples

### Left Side Only
```hcl
module "vpn_ha-1" {
  source = "./vpn"

  cloud_router = "tranquility-router"

  gcp_vpc = "main-one"

  gcp_asn = "64513"

  gcp_region = "europe-west2"

  vpn_gw = "vpn-gw-1"

  secret_one = var.secret_one

  secret_two = var.secret_two

  tunnel0 = "tunnel-1"

  peer_gateway = "vpn-gw-2"

  peer_project_id = "example-two"

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

  gcp_project_id = "example-one"
  }
```

### Both Sides
```hcl
module "vpn_ha-1" {
  source = "./vpn"

  cloud_router = "tranquility-router"

  gcp_vpc = "main-one"

  gcp_asn = "64513"

  gcp_region = "europe-west2"

  vpn_gw = "vpn-gw-1"

  secret_one = var.secret_one

  secret_two = var.secret_two

  tunnel0 = "tunnel-1"

  peer_gateway = "vpn-gw-2"

  peer_project_id = "example-two"

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

  gcp_project_id = "example-one"
  }
  
module "vpn_ha-2" {
  source = "./vpn"

  cloud_router = "tranquility-router-two"

  gcp_vpc = "main-two"

  gcp_asn = "64514"

  gcp_region = "europe-west2"

  vpn_gw = "vpn-gw-2"

  secret_one = var.secret_one

  secret_two = var.secret_two

  tunnel0 = "tunnel-3"

  peer_gateway = "vpn-gw-1"

  peer_project_id = "example-one"

  tunnel1 = "tunnel-4"

  router1_int0 = "router-2-interface-name-0"

  router1_inside0 = "169.254.6.2/30"

  router1_int1 = "router-2-interface-name-1"

  router1_inside1 = "169.254.7.2/30"

  bgp_peer_1 = "peer-3"

  gcp_asn_two = "64513"

  router1_peer1 = "169.254.6.1"

  bgp_peer_2 = "peer-4"

  router1_peer2 = "169.254.7.1"

  gcp_project_id = "example-two"

}  
```

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

