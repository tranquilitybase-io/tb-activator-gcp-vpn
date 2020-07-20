module "vpn_ha-1" {
  source = "../vpn"

  cloud_router = "tranquility-router"

  gcp_vpc = "main-one"

  gcp_asn = "64513"

  gcp_region = "europe-west2"

  vpn_gw = "vpn-gw-1"

  secret_one = var.secret_one

  secret_two = var.secret_two

  tunnel0 = "tunnel-1"

  peer_gateway = "vpn-gw-2"

  peer_project_id = "vpn-test-282811"

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

  gcp_project_id = "zain-sandbox"

}

module "vpn_ha-2" {
  source = "../vpn"

  cloud_router = "tranquility-router-two"

  gcp_vpc = "main-two"

  gcp_asn = "64514"

  gcp_region = "europe-west2"

  vpn_gw = "vpn-gw-2"

  secret_one = var.secret_one

  secret_two = var.secret_two

  tunnel0 = "tunnel-3"

  peer_gateway = "vpn-gw-1"

  peer_project_id = "zain-sandbox"

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

  gcp_project_id = "vpn-test-282811"

}