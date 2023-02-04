# packer-image-ubuntu

This packer build creates ubuntu images for VMware vSphere and can export the resulting image as OVA.

## Requirements

* Recent version of packer installed.
* vCenter Server or ESXi host with license
* Internet-Connection during provisioning to apply updates and ansible roles

## Usage

1. Clone or copy the repository
2. Create a copy of the ubuntu-vsphere-iso.pkrvars.hcl.template file and remove the last extension
3. Fill in the required variables
4. Execute the packer build command

## Available builds

* vsphere-iso.ubuntu-template
* vsphere-iso.ubuntu-ova
* vsphere-iso.ubuntu-template-esx

## Allowed URLs

```yaml
# FOCAL
iso_url = "https://releases.ubuntu.com/focal/ubuntu-20.04.5-live-server-amd64.iso"
iso_checksum = "file:https://releases.ubuntu.com/focal/SHA256SUMS"

# JAMMY
iso_url = "https://releases.ubuntu.com/jammy/ubuntu-22.04.1-live-server-amd64.iso"
iso_checksum = "file:https://releases.ubuntu.com/jammy/SHA256SUMS"
```

## Execute build

```bash
# build default basic image
packer build -var-file="./ubuntu-vsphere-iso.pkrvars.hcl" -only="vsphere-iso.ubuntu-template" .

# build ova image
packer build -var-file="./ubuntu-vsphere-iso.pkrvars.hcl" -only="vsphere-iso.ubuntu-ova" .

# build default basic image on esxi
packer build -var-file="./ubuntu-vsphere-iso.pkrvars.hcl" -only="vsphere-iso.ubuntu-template-esxi" .
```
