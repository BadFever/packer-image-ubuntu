# packer-image-ubuntu

This packer build creates basic ubuntu images for VMware vSphere and VMware Workstation.

## Builders

* vsphere-iso
* vmware-iso

## Generate crypted password

```bash
mkpasswd -m sha-512
```

## Execute build

```bash
# build default basic image
packer build -var-file="./ubuntu-vsphere-iso.pkrvars.hcl" -only="vsphere-iso.ubuntu_server" .

# build specific k8s ready image
packer build -var-file="./ubuntu-vsphere-iso-k8s.pkrvars.hcl" -only="vsphere-iso.ubuntu_server" .
```
