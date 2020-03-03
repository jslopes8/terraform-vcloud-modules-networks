variable "create" {
    type    = bool
    default = "true"
}
variable "name" {
    type    = string
}
variable "edge_gateway" {
    type    = string
    default = ""
}
variable "gateway_cidr" {
    type    = string
}
variable "dns1" {
    type    = string
    default  = ""
}
variable "dns2" {
    type    = string
    default  = ""
}
variable "description" {
    type    = string
    default = ""
}
variable "network_type" {
    type    = string
}
variable "dns_suffix" {
    type    = string
    default = ""
}
variable "interface_type"  {
    type    = string
    default = "internal"
}
variable "static_ip_pool" {
    type    = list(map(string))    
}
variable "dhcp_pool" {
    type    = list(map(string))
    default = []    
}
variable "netmask" {
    type    = string
    default = "255.255.255.0"
}

