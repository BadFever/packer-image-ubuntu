variable "iso_url" {
    type = string
    default = ""
}

variable "iso_checksum" {
    type = string
    default = ""
}

variable "boot_command" {
    type = list(string)
    default = []
}

variable "ssh_username" {
    type = string
    default = "ubuntu"
}

variable "firmware" {
    type = string
    default = "bios"
}

variable "guest_os_type" {
    type = string
    default = "ubuntu-64"
}

variable "ssh_password" {
    type = string
    default = "ansible"
    sensitive = true
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

variable "output_directory" {
    type = string
    default = "build"
}

variable "http_directory" {
    type = string
    default = "http"
}

variable "ansible_ssh_public_key" {
    type = string
    default = ""
}

locals {
  version = formatdate("YYYYMMDD_hh_mm_ss",timestamp())
}