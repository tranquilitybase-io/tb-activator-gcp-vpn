output vpn_one_interface_0_ip_address {
  description = "The IP address associated with interface 0 of the left VPN Gateway"
  value = module.vpn_ha-1.vpn_interface_0_ip_address
}

output vpn_one_interface_1_ip_address {
  description = "The IP address associated with interface 1 of the left VPN Gateway"
  value = module.vpn_ha-1.vpn_interface_1_ip_address
}

output vpn_two_interface_0_ip_address {
  description = "The IP address associated with interface 0 of the right VPN Gateway"
  value = module.vpn_ha-2.vpn_interface_0_ip_address
}

output vpn_two_interface_1_ip_address {
  description = "The IP address associated with interface 1 of the right VPN Gateway"
  value = module.vpn_ha-2.vpn_interface_1_ip_address
}
