build {
  sources = ["sources.vmware-iso.ubuntu_server"]

  provisioner "shell" {
    execute_command = "echo '${var.ssh_password}' | {{.Vars}} sudo -E -S bash '{{.Path}}'"
    expect_disconnect = true
    scripts = [
      "./provisioner/bootstrap.sh"
    ]
  }

  provisioner "ansible-local" {
    playbook_file = "./provisioner/playbook.yml"
    galaxy_file = "./provisioner/requirements.yml"
    extra_arguments = [
      "--extra-vars",
      "\"bootstrap_ansible_user_ssh_public_key='${var.ansible_ssh_public_key}'\""
    ]
  }
}