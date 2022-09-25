# packer-image-ubuntu

This packer build creates basic ubuntu images for VMware vSphere.

## Requirements

* Recent version of packer installed.

## Usage

1. Clone or copy the repository
2. Create a copy of the ubuntu-vsphere-iso.pkrvars.hcl.template file and remove the last extension
3. Fill in the required variables
4. Execute the packer build command

### Additional Notes

## Generate crypted password

```bash
mkpasswd -m sha-512
```

## Execute build

```bash
# build default basic image
packer build -var-file="./ubuntu-vsphere-iso.pkrvars.hcl" -only="vsphere-iso.ubuntu-template" .

# build specific k8s ready image
packer build -var-file="./ubuntu-vsphere-iso-k8s.pkrvars.hcl" -only="vsphere-iso.ubuntu_server" .
```
