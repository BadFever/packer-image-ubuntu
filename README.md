# packer-image-ubuntu

This packer build creates basic ubuntu images for VMware vSphere.

## Requirements

* Recent version of packer installed.
* vCenter Server or ESXi host with license

## Usage

1. Clone or copy the repository
2. Create a copy of the ubuntu-vsphere-iso.pkrvars.hcl.template file and remove the last extension
3. Fill in the required variables
4. Execute the packer build command

## Available builds

* sources.vsphere-iso.ubuntu-template
* sources.vsphere-iso.ubuntu-template-esx

## Execute build

```bash
# build default basic image
packer build -var-file="./ubuntu-vsphere-iso.pkrvars.hcl" -only="vsphere-iso.ubuntu-template" .

# build default basic image on esxi
packer build -var-file="./ubuntu-vsphere-iso.pkrvars.hcl" -only="vsphere-iso.ubuntu-template-esxi" .
```
