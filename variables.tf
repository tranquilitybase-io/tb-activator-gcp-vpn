variable "cloud_router" {
  description = "The name of the cloud router which is responsible for routes to be exchanged dynamically"
}

variable "secret_one" {
  description = "The secret for the first tunnel"
}

variable "secret_two" {
  description = "The secret for the second tunnel"
}

variable "gcp_vpc" {
  description = "The name of the network for which the resource belongs to"
}

variable "gcp_asn" {
  description = "The private asn that is used for all BGP sessions managed by the cloud router on the left side of the connection"
}

variable "gcp_region" {
  description = "The region for which the resource will be located in"
}

variable "vpn_gw" {
  description = "The VPN Gateway for the left side of the connection"
}

variable "tunnel0" {
  description = "The tunnel that will be connected to interface 0 on the VPN Gateways"
}

variable "peer_gateway" {
  description = "The peer VPN Gateway for the right side of the connection"
}

variable "peer_project_id" {
  description = "The ID of the project for where the peer VPN Gateway is created. ID of the project that is on the right side of the connection"
}

variable "tunnel1" {
   description = "The tunnel that will be connected to interface 1 on the VPN Gateways"
}

variable "router1_int0" {
   description = "The name of the cloud router interface on interface 0"
}

variable "router1_inside0" {
  description = "BGP IP address for the tunnel on interface 0"
}

variable "router1_int1" {
  description = "The name of the cloud router interface on interface 1"
}

variable "router1_inside1" {
    description = "BGP IP address for the tunnel on interface 1"
}

variable "bgp_peer_1" {
    description = "Name of BGP peer on interface 0"
}

variable "gcp_asn_two" {
      description = "ASN used by the peer VPN Gateway"
}

variable "router1_peer1" {
    description = "BGP peer IP address for the tunnel on interface 0"
}

variable "bgp_peer_2" {
      description = "Name of BGP peer on interface 1"
}

variable "router1_peer2" {
    description = "BGP IP address for the tunnel on interface 1"
}

variable "gcp_project_id" {
   description = "The ID of the project for where the VPN Gateway is created. ID of the project that is on the left side of the connection"
}