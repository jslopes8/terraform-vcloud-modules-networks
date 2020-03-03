resource "vcd_network_routed" "network_router" {
    count   = var.create && var.network_type == "routed" ? 1 : 0

    name            = var.name
    description     = var.description
    edge_gateway    = var.edge_gateway
    gateway         = cidrhost(var.gateway_cidr, 1)
    netmask         = cidrnetmask(var.gateway_cidr)
    interface_type  = var.interface_type 
    dns1            = var.dns1
    dns2            = var.dns2
    dns_suffix      = var.dns_suffix

    dynamic "static_ip_pool" {
        for_each    = var.static_ip_pool
        content {
            start_address   = static_ip_pool.value.start_address
            end_address     = static_ip_pool.value.end_address
        }
    }
    dynamic "dhcp_pool" {
        for_each    = var.dhcp_pool
        content {
            start_address   = lookup(dhcp_pool.value, "start_address", null )
            end_address     = lookup(dhcp_pool.value, "end_address", null )
            max_lease_time  = lookup(dhcp_pool.value, "max_lease_time", null )
        }
    }
}
resource "vcd_network_isolated" "network_isolated" {
    count   = var.create && var.network_type == "isolated" ? 1 : 0

    name            = var.name
    description     = var.description
    gateway         = cidrhost(var.gateway_cidr, 1)
    netmask         = cidrnetmask(var.gateway_cidr) 
    dns1            = var.dns1
    dns2            = var.dns2
    dns_suffix      = var.dns_suffix

    dynamic "static_ip_pool" {
        for_each    = var.static_ip_pool
        content {
            start_address   = static_ip_pool.value.start_address
            end_address     = static_ip_pool.value.end_address
        }
    }
    dynamic "dhcp_pool" {
        for_each    = var.dhcp_pool
        content {
            start_address   = lookup(dhcp_pool.value, "start_address", null )
            end_address     = lookup(dhcp_pool.value, "end_address", null )
            max_lease_time  = lookup(dhcp_pool.value, "max_lease_time", null )
        }
    }
}
