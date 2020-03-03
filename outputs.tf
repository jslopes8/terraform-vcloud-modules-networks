output "network_name" {
  value = vcd_network_routed.network_router.*.name
}
output "network_gateway" {
  value = vcd_network_routed.network_router.*.gateway
}