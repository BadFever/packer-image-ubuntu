build {
  sources = ["sources.vsphere-iso.ubuntu_ova"]

  provisioner "shell" {
    execute_command = "echo 'VMware1!' | {{.Vars}} sudo -E -S bash '{{.Path}}'"
    expect_disconnect = true
    scripts = [
      "./provisioner/bootstrap.sh"
    ]
    pause_before = "15s"
  }

  provisioner "ansible-local" {
    playbook_file = "./provisioner/${var.vm_role}/playbook.yml"
    galaxy_file = "./provisioner/${var.vm_role}/requirements.yml"
    extra_arguments = [
      "--extra-vars",
      "\"bootstrap_ansible_user_ssh_public_key='${var.ssh_public_key}'\""
    ]
  }

}