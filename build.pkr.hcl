build {
  sources = ["sources.vmware-iso.ubuntu_server","sources.vsphere-iso.ubuntu_server"]

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

/*   post-processor "shell-local" {
    only = ["vsphere-iso.ubuntu_server"]
    environment_vars = [
      "VIServer=${var.vsphere_vcenter_server}",
      "User=${var.vsphere_username}",
      "PW=${var.vsphere_password}",
      "ContentLibrary=${var.vsphere_content_library}",
      "ContentLibraryItemName=Ubuntu Focal 20.04.2-${var.vm_role}-${local.version}",
      "VMRole=${var.vm_role}"]
    execute_command = ["powershell.exe", "{{.Vars}} {{.Script}}"]
    env_var_format = "$env:%s=\"%s\"; "
    script = "./post-processors/vsphere_library_rotate.ps1"
  } */

}