source "vmware-iso" "ubuntu_server" {
  vm_name = "${var.guest_os_type}-${var.firmware}-${local.version}"
  guest_os_type = "${var.guest_os_type}"
  cpus = "${var.cpus}"
  memory = "${var.memory}"
  disk_size = "${var.disk_size}"
  boot_wait = "5s"
  boot_command = "${var.boot_command}"
  shutdown_command = "echo '${var.ssh_password}' | sudo -S shutdown -P now"

  iso_url = "${var.iso_url}"
  iso_checksum = "${var.iso_checksum}"
  ssh_username = "ubuntu"
  ssh_password = "ansible"
  ssh_pty = true
  ssh_timeout = "20m"
  ssh_handshake_attempts = 20
  keep_registered = false
  http_directory = "${var.http_directory}"
  output_directory = "${var.output_directory}/${var.guest_os_type}-${var.firmware}-${local.version}"
}
