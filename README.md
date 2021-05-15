# packer-image-ubuntu

## Generate crypted password

```bash
mkpasswd -m sha-512
```

## Execute build

```bash
packer build -var-file="./ubuntu-vsphere-iso.pkrvars.hcl
```
