source "vsphere-iso" "ubuntu-template" {
  
  vm_name = "${local.build_os}-${local.build_os_friendly_name}-${local.build_os_version}_${local.build_time}(${var.branch})"
  guest_os_type = "${var.guest_os_type}"
  firmware = "${var.firmware}"
  vm_version = "${var.vsphere_hardware_version}"

  CPUs = "${var.cpus}"
  cpu_cores = "${var.cpu_cores}"
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
  
  boot_wait = "${var.boot_wait}"
  boot_command = "${var.boot_command}"
  shutdown_command = "echo 'VMware1!' | sudo -S shutdown -P now"

  configuration_parameters = {
    "disk.EnableUUID" = "TRUE"
  }

  iso_url = "${var.iso_url}"
  iso_checksum = "${var.iso_checksum}"
  ssh_username = "mystic"
  ssh_password = "VMware1!"
  ssh_pty = true
  ssh_timeout = "20m"
  ssh_handshake_attempts = 50
  cd_files = [
    "./autoinstall/meta-data",
    "./autoinstall/user-data"]
  cd_label = "cidata"

  vcenter_server = "${var.vsphere_vcenter_server}"
  username = "${var.vsphere_username}"
  password = "${var.vsphere_password}"
  insecure_connection = "${var.vsphere_insecure_connection}"
  datacenter = "${var.vsphere_datacenter}"
  host = "${var.vsphere_host}"
  datastore = "${var.vsphere_datastore}"
  folder = "${var.vsphere_folder}"

}

source "vsphere-iso" "ubuntu-ova" {
  
  vm_name = "${local.build_os}-${local.build_os_friendly_name}-${local.build_os_version}_${local.build_time}"
  guest_os_type = "${var.guest_os_type}"
  firmware = "${var.firmware}"
  vm_version = "${var.vsphere_hardware_version}"

  CPUs = "${var.cpus}"
  cpu_cores = "${var.cpu_cores}"
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
  
  boot_wait = "${var.boot_wait}"
  boot_command = "${var.boot_command}"
  shutdown_command = "echo 'VMware1!' | sudo -S shutdown -P now"

  configuration_parameters = {
    "disk.EnableUUID" = "TRUE"
  }

  iso_url = "${var.iso_url}"
  iso_checksum = "${var.iso_checksum}"
  ssh_username = "mystic"
  ssh_password = "VMware1!"
  ssh_pty = true
  ssh_timeout = "${var.ssh_timeout}"
  ssh_handshake_attempts = 50
  cd_files = [
    "./autoinstall/meta-data",
    "./autoinstall/user-data"]
  cd_label = "cidata"

  vcenter_server = "${var.vsphere_vcenter_server}"
  username = "${var.vsphere_username}"
  password = "${var.vsphere_password}"
  insecure_connection = "${var.vsphere_insecure_connection}"
  datacenter = "${var.vsphere_datacenter}"
  host = "${var.vsphere_host}"
  datastore = "${var.vsphere_datastore}"
  folder = "${var.vsphere_folder}"

  export {
    force = true
    output_directory = "${var.output_directory}/${local.build_os}-${local.build_os_friendly_name}-${local.build_os_version}_${local.build_time}"
  }

}

source "vsphere-iso" "ubuntu-template-esx" {
  
  vm_name = "${local.build_os}-${local.build_os_friendly_name}-${local.build_os_version}_${local.build_time}"
  guest_os_type = "${var.guest_os_type}"
  firmware = "${var.firmware}"
  vm_version = "${var.vsphere_hardware_version}"

  CPUs = "${var.cpus}"
  cpu_cores = "${var.cpu_cores}"
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
  
  boot_wait = "${var.boot_wait}"
  boot_command = "${var.boot_command}"
  shutdown_command = "echo 'VMware1!' | sudo -S shutdown -P now"

  configuration_parameters = {
    "disk.EnableUUID" = "TRUE"
  }

  iso_url = "${var.iso_url}"
  iso_checksum = "${var.iso_checksum}"
  ssh_username = "mystic"
  ssh_password = "VMware1!"
  ssh_pty = true
  ssh_timeout = "${var.ssh_timeout}"
  ssh_handshake_attempts = 50
  cd_files = [
    "./autoinstall/meta-data",
    "./autoinstall/user-data"]
  cd_label = "cidata"
  vcenter_server = "${var.vsphere_vcenter_server}"
  username = "${var.vsphere_username}"
  password = "${var.vsphere_password}"
  insecure_connection = "${var.vsphere_insecure_connection}"
  host = "${var.vsphere_host}"
  datastore = "${var.vsphere_datastore}"
}