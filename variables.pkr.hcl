############################ GENERAL ############################

variable "iso_url" {
    type = string
}

variable "iso_checksum" {
    type = string
}

variable "output_directory" {
    type = string
    default = "build"
}


############################ PROVISIONING VARIABLES ############################

variable "ssh_timeout" {
    type = string
    default = "30m"
}

variable "boot_wait" {
    type = string
    default = "1s"
}

variable "mystic_user_ssh_public_key" {
    type = string
    default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOOoeaJZBSL0axmVNJksxWpbiEzHIgiVhar0ug8YVzd3 mystic"
}

variable "boot_command" {
    type = list(string)
    default = [
        "<wait><wait><wait>c<wait><wait><wait>",
        "linux /casper/vmlinuz --- autoinstall ipv6.disable=1<enter><wait>",
        "initrd /casper/initrd<enter><wait>",
        "boot<enter><wait>"
    ]
}

############################ VM VARIABLES ############################

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

variable "install_base" {
    type = string
    default = "default"
}

############################ VSPHERE VARIABLES ############################

variable "vsphere_vcenter_server" {
    type = string
}

variable "vsphere_username" {
    type = string
}

variable "vsphere_password" {
    type = string
    sensitive = true
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
}

variable "vsphere_host" {
    type = string
    default = ""
}

variable "vsphere_network" {
    type = string
}

variable "vsphere_folder" {
    type = string
    default = "/Discovered virtual machine"
}

variable "vsphere_hardware_version" {
    type = number
    default = 12
}

variable "branch" {
    type = string
    default = ""
}

############################ LOCAL VARIABLES ############################

locals {
  build_time = formatdate("YYYYMMDD'T'hhmmss",timestamp())
  build_os = split("-", split("/", "${var.iso_url}")[4])[0]
  build_os_version = split("-", split("/", "${var.iso_url}")[4])[1]
  build_os_friendly_name = split("/","${var.iso_url}")[3]
}