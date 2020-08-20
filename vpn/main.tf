// Create cloud router
resource "google_compute_router" "router-a" {
  provider = "google"
  project = var.gcp_project_id
  region = var.gcp_region
  name    = var.cloud_router
  network  = var.gcp_vpc
  bgp {
    asn = var.gcp_asn
   # advertise_mode    = "CUSTOM"
    #advertised_groups = ["ALL_SUBNETS"]
    #advertised_ip_ranges {
     # range = google_compute_subnetwork.network1-subnet1.ip_cidr_range
    #}
    #advertised_ip_ranges {
     # range = google_compute_subnetwork.network1-subnet2.ip_cidr_range
    }

  }

// Create HA VPN gateway
resource "google_compute_ha_vpn_gateway" "ha_gateway" {
  provider = "google-beta"
  project = var.gcp_project_id
  region = var.gcp_region
  name     = var.vpn_gw
  network  = var.gcp_vpc

}


// Create first VPN tunnel
resource "google_compute_vpn_tunnel" "tunnel0" {
  provider         = "google-beta"
  project = var.gcp_project_id
  name             = var.tunnel0
  region           = var.gcp_region
  vpn_gateway      = google_compute_ha_vpn_gateway.ha_gateway.name
  peer_gcp_gateway = "projects/${var.peer_project_id}/regions/${var.gcp_region}/vpnGateways/${var.peer_gateway}"
  shared_secret    = var.secret_one
  router           = google_compute_router.router-a.self_link
  vpn_gateway_interface = 0
  depends_on = [google_compute_router.router-a,google_compute_ha_vpn_gateway.ha_gateway]
}

// Create second VPN tunnel
resource "google_compute_vpn_tunnel" "tunnel1" {
  provider         = "google-beta"
  project          = var.gcp_project_id
  name             = var.tunnel1
  region           = var.gcp_region
  vpn_gateway      = google_compute_ha_vpn_gateway.ha_gateway.name
  peer_gcp_gateway = "projects/${var.peer_project_id}/regions/${var.gcp_region}/vpnGateways/${var.peer_gateway}"
  shared_secret    = var.secret_two
  router           = google_compute_router.router-a.self_link
  vpn_gateway_interface = 1
  depends_on = [google_compute_router.router-a,google_compute_ha_vpn_gateway.ha_gateway]
}

// Create first cloud router interface
resource "google_compute_router_interface" "router-name-10" {
  provider   = "google-beta"
  project    = var.gcp_project_id
  name       = var.router1_int0
  router     = google_compute_router.router-a.name
  region     = var.gcp_region
  ip_range   = var.router1_inside0
  vpn_tunnel = google_compute_vpn_tunnel.tunnel0.self_link
  depends_on = [google_compute_router.router-a,google_compute_vpn_tunnel.tunnel0]
}

// Create second cloud router interface
resource "google_compute_router_interface" "router-name-11" {
  provider   = "google-beta"
  project    = var.gcp_project_id
  name       = var.router1_int1
  router     = google_compute_router.router-a.name
  region     = var.gcp_region
  ip_range   = var.router1_inside1
  vpn_tunnel = google_compute_vpn_tunnel.tunnel1.self_link
  depends_on = [google_compute_router.router-a,google_compute_vpn_tunnel.tunnel1]
}

// Create first BGP peer
resource "google_compute_router_peer" "peer1" {
  provider         = "google-beta"
  project          = var.gcp_project_id
  name                      = var.bgp_peer_1
  router                    = google_compute_router.router-a.name
  region                    = var.gcp_region
  peer_asn                  = var.gcp_asn_two
  advertised_route_priority = 100
  interface                 = google_compute_router_interface.router-name-10.name
  peer_ip_address = var.router1_peer1
  depends_on = [google_compute_router.router-a,google_compute_router_interface.router-name-10]

}

// Create second BGP peer
resource "google_compute_router_peer" "peer2" {
  provider         = "google-beta"
  project          = var.gcp_project_id
  name                      = var.bgp_peer_2
  router                    = google_compute_router.router-a.name
  region                    = var.gcp_region
  peer_asn                  = var.gcp_asn_two
  advertised_route_priority = 100
  interface                 = google_compute_router_interface.router-name-11.name
  peer_ip_address = var.router1_peer2
  depends_on = [google_compute_router.router-a,google_compute_router_interface.router-name-11]
}
