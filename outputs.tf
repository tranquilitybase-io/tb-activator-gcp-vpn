output vpn_interface_0_ip_address {
  description = "The IP address associated with interface 0 of the VPN Gateway"
  value = module.vpn.vpn_interface_0_ip_address
}

output vpn_interface_1_ip_address {
   description = "The IP address associated with interface 1 of the VPN Gateway"
   value = module.vpn.vpn_interface_1_ip_address
}