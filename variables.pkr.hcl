############################ PROVISIONING VARIABLES ############################

variable "iso_url" {
    type = string
    default = "https://releases.ubuntu.com/focal/ubuntu-20.04.5-live-server-amd64.iso"
}

variable "iso_checksum" {
    type = string
    default = "file:https://releases.ubuntu.com/focal/SHA256SUMS"
}

variable "output_directory" {
    type = string
    default = "build"
}

variable "http_directory" {
    type = string
    default = "http"
}

variable "ssh_username" {
    type = string
    default = "ansible"
}

variable "ssh_password" {
    type = string
    default = "VMware1!"
    sensitive = true
}

variable "boot_wait" {
    type = string
    default = "1s"
}

variable "ansible_ssh_public_key" {
    type = string
    default = ""
}

variable "boot_command" {
    type = list(string)
    default = [
        "<wait><wait><wait><esc><esc><esc><enter><wait><wait><wait>",
        "linux /casper/vmlinuz --- autoinstall ds=\"nocloud-net;seedfrom=http://{{ .HTTPIP }}:{{ .HTTPPort }}/\"<enter><wait>",
        "initrd /casper/initrd<enter><wait>",
        "boot<enter><wait>"
    ]
}

############################ VM VARIABLES ############################

variable "firmware" {
    type = string
    default = "efi"
}

variable "guest_os_type" {
    type = string
    default = "ubuntu64guest"
}

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

variable "cpu_cores" {
  type    = string
  default = "1"
}

variable "vm_version" {
    type = number
    default = 12
}

variable "vm_role" {
    type = string
    default = "default"
}

############################ VSPHERE VARIABLES ############################

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

variable "vsphere_datastore" {
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

############################ LOCAL VARIABLES ############################

locals {
  version = formatdate("YYYYMMDD'T'hhmmss",timestamp())
}