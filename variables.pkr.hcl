############################## COMMON VARS ##############################

variable "iso_url" {
    type = string
    default = ""
}

variable "iso_checksum" {
    type = string
    default = "file:https://releases.ubuntu.com/focal/SHA256SUMS"
}

variable "boot_wait" {
    type = string
    default = "1s"
}

variable "http_directory" {
    type = string
    default = "http"
}

############################## PROVISIONG VARS ##############################

variable "ssh_public_key" {
    type = string
    default = ""
}

variable "vm_role" {
    type = string
    default = "default"
}

variable "ssh_username" {
    type = string
    default = "ansible"
}

# Do not change as set in user-data
variable "ssh_password" {
    type = string
    default = "VMware1!"
}

############################## VM VARS ##############################

variable "disk_size" {
    type = string
    default = "25600"
}

variable "memory" {
  type    = string
  default = "4096"
}

variable "cpus" {
  type    = string
  default = "2"
}

variable "vm_version" {
    type = number
    default = 17
}

############################## VSPHERE VARS ##############################

variable "vsphere_vcenter_server" {
    type = string
    default = ""
}

variable "vsphere_username" {
    type = string
    default = ""
}

variable "vsphere_password" {
    type = string
    default = ""
}

variable "vsphere_insecure_connection" {
    type = bool
    default = true
}

variable "vsphere_datacenter" {
    type = string
    default = ""
}

variable "vsphere_host" {
    type = string
    default = ""
}

variable "vsphere_network" {
    type = string
    default = "VM Network"
}

variable "vsphere_folder" {
    type = string
    default = ""
}

variable "vsphere_datastore" {
    type = string
    default = ""
}

############################## OUTPUT VARS ##############################

variable "output_directory" {
    type = string
    default = "build"
}

############################## LOCAL VARS ##############################

locals {
  version = formatdate("YYYYMMDD'T'hhmmss",timestamp())
}