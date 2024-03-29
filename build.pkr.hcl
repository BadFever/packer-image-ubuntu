build {
  sources = ["sources.vsphere-iso.ubuntu-template"]

  provisioner "shell" {
    execute_command = "echo '${var.ssh_password}' | {{.Vars}} sudo -E -S bash '{{.Path}}'"
    expect_disconnect = true
    scripts = [
      "./provisioner/bootstrap.sh"
    ]
    pause_before = "15s"
  }

  provisioner "ansible-local" {
    playbook_file = "./provisioner/${var.vm_role}/playbook.yml"
    galaxy_file = "./provisioner/${var.vm_role}/requirements.yml"
    galaxy_roles_path = "/usr/share/ansible/roles"
    extra_arguments = [
      "--extra-vars",
      "\"bootstrap_ansible_user_ssh_public_key='${var.ansible_ssh_public_key}'\""
    ]
  }

  post-processors {
    post-processor "vsphere-template"{
      host                = "${var.vsphere_vcenter_server}"
      insecure            = "${var.vsphere_insecure_connection}"
      username            = "${var.vsphere_username}"
      password            = "${var.vsphere_password}"
      datacenter          = "${var.vsphere_datacenter}"   
      folder              = "/${var.vsphere_folder}"
    }
  }

}

build {
  sources = ["sources.vsphere-iso.ubuntu-template-esx", "sources.vsphere-iso.ubuntu-ova"]

  provisioner "shell" {
    execute_command = "echo '${var.ssh_password}' | {{.Vars}} sudo -E -S bash '{{.Path}}'"
    expect_disconnect = true
    scripts = [
      "./provisioner/bootstrap.sh"
    ]
    pause_before = "15s"
  }

  provisioner "ansible-local" {
    playbook_file = "./provisioner/${var.vm_role}/playbook.yml"
    galaxy_file = "./provisioner/${var.vm_role}/requirements.yml"
    galaxy_roles_path = "/usr/share/ansible/roles"
    extra_arguments = [
      "--extra-vars",
      "\"bootstrap_ansible_user_ssh_public_key='${var.ansible_ssh_public_key}'\""
    ]
  }

}