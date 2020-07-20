module "vpn" {
  source = "./vpn"

  bgp_peer_1 = var.bgp_peer_1
  bgp_peer_2 = var.bgp_peer_2
  cloud_router = var.cloud_router
  gcp_asn = var.gcp_asn
  gcp_asn_two = var.gcp_asn_two
  gcp_project_id = var.gcp_project_id
  gcp_region = var.gcp_region
  gcp_vpc = var.gcp_vpc
  peer_gateway = var.peer_gateway
  peer_project_id = var.peer_project_id
  router1_inside0 = var.router1_inside0
  router1_inside1 = var.router1_inside1
  router1_int0 = var.router1_int0
  router1_int1 = var.router1_int1
  router1_peer1 = var.router1_peer1
  router1_peer2 = var.router1_peer2
  secret_one = var.secret_one
  secret_two = var.secret_two
  tunnel0 = var.tunnel0
  tunnel1 = var.tunnel1
  vpn_gw = var.vpn_gw
}