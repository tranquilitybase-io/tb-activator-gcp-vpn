# Terraform Google Cloud Platform - GCP HA VPN Module

A Terraform module for creating HA VPN connection between 2 GCP networks.

This modules makes it easy to set up VPN connectivity in GCP by defining your gateways and tunnels.

It supports creating:

- A Google VPN Gateway
- Tunnels connecting the gateway to defined GCP peer
- Dynamic routes with cloud router

