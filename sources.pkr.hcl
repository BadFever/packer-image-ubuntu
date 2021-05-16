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
  pause_before_connecting = "30s"
  keep_registered = false
  http_directory = "${var.http_directory}/vmware-iso/"
  output_directory = "${var.output_directory}/${var.guest_os_type}-${var.firmware}-${local.version}"
}

source "vsphere-iso" "ubuntu_server" {
  
  vm_name = "${var.guest_os_type}-${var.firmware}-${var.vm_role}-${local.version}"
  guest_os_type = "${var.guest_os_type}"
  firmware = "bios"
  vm_version = "${var.vm_version}"

  CPUs = "${var.cpus}"
  cpu_cores = 1
  CPU_reservation = 0
  CPU_limit = 0
  CPU_hot_plug = false
  RAM = "${var.memory}"
  RAM_reservation = 0
  RAM_reserve_all = false
  RAM_hot_plug = false

  network_adapters {
    network = "${var.vsphere_network}"
    network_card = "vmxnet3"
  }

  disk_controller_type = ["pvscsi"]

  storage {
    disk_size = "${var.disk_size}"
    disk_thin_provisioned = true
    disk_controller_index = 0
  }
  
  boot_wait = "5s"
  boot_command = "${var.boot_command}"
  shutdown_command = "echo '${var.ssh_password}' | sudo -S shutdown -P now"

  iso_url = "${var.iso_url}"
  iso_checksum = "${var.iso_checksum}"
  ssh_username = "ubuntu"
  ssh_password = "ansible"
  ssh_pty = true
  ssh_timeout = "20m"
  ssh_handshake_attempts = 50
  http_directory = "${var.http_directory}/vsphere-iso/"

  vcenter_server = "${var.vsphere_vcenter_server}"
  username = "${var.vsphere_username}"
  password = "${var.vsphere_password}"
  insecure_connection = "${var.vsphere_insecure_connection}"
  datacenter = "${var.vsphere_datacenter}"
  host = "${var.vsphere_host}"

  content_library_destination {
    library = "${var.vsphere_content_library}"
    name = "Ubuntu Focal 20.04.2-${var.vm_role}-${local.version}"
    description = "${local.version}"
    folder = "${var.vsphere_folder}"
    destroy = true
  }

  #export {
  #  force = true
  #  output_directory = "${var.output_directory}/${var.guest_os_type}-${var.firmware}-${local.version}"
  #}
}
