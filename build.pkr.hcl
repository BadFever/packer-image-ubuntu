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
    extra_arguments = [
      "--extra-vars",
      "\"bootstrap_ansible_user_ssh_public_key='${var.ansible_ssh_public_key}'\""
    ]
  }

}