# packer-image-ubuntu

This packer build creates ubuntu images for VMware vSphere and can export the resulting image as OVA.
The default installation base installs just the required software do be further automated using the provided mystic user.

Please change the password of the default mystic user after cloning.

## Requirements

* Recent version of packer installed.
  * <https://developer.hashicorp.com/packer/install?product_intent=packer>
* vCenter Server or ESXi host with license
* Internet-Connection during provisioning to apply updates and ansible roles

## Build Variables

### ISO Configuration

```bash
iso_url = "https://releases.ubuntu.com/focal/ubuntu-20.04.5-live-server-amd64.iso"
```

```bash
iso_checksum = "file:https://releases.ubuntu.com/focal/SHA256SUMS"
```

```bash
ansible_ssh_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOOoeaJZBSL0axmVNJksxWpbiEzHIgiVhar0ug8YVzd3 mystic"
```

This public key references an insecure private key which has to replaced once deployed.

```
-----BEGIN OPENSSH PRIVATE KEY-----
b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAAAMwAAAAtzc2gtZW
QyNTUxOQAAACDjqHmiWQUi9GsZlTSZLMVqW4hMxyIIlYWq9LoPGFc3dwAAAJi8dOftvHTn
7QAAAAtzc2gtZWQyNTUxOQAAACDjqHmiWQUi9GsZlTSZLMVqW4hMxyIIlYWq9LoPGFc3dw
AAAEAPct+bcDGt0Pqe2z7qmUmJ/rXc0D7bqp9qbeRJCiNRlOOoeaJZBSL0axmVNJksxWpb
iEzHIgiVhar0ug8YVzd3AAAAEGJhZGZldmVyQHRhbmlzaGEBAgMEBQ==
-----END OPENSSH PRIVATE KEY-----
```


```bash
output_directory = ""
```

### VMware vSphere Configuration

```bash
vsphere_vcenter_server = ""
```

```bash
vsphere_username = ""
```

```bash
vsphere_password = ""
```

```bash
vsphere_insecure_connection = true
```

```bash
vsphere_datacenter = ""
```

```bash
vsphere_host = ""
```

```bash
vsphere_network = ""
```

```bash
vsphere_folder = ""
```

```bash
vsphere_datastore = ""
```

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
packer build -var-file="./ubuntu-vsphere-iso.pkrvars.hcl" -only="vsphere-iso.ubuntu-template-esx" .
```

Boot Command for HTTP

```hcl

```
