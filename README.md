# env

create my development environment.

## Requirements

- Virtualbox
- Vagrant
- Ansible

## Packer template

use [shiguredo/packer-templates](https://github.com/shiguredo/packer-templates).

```sh
git clone https://github.com/shiguredo/packer-templates.git
cd packer-templates/ubuntu-14.04
packer build -only=virtualbox-iso template.json
vagrant box add ubuntu-14-04-x64-virtualbox.box --name ubuntu-1404
```

## Provisioning

use Ansible.

```sh
vagrant provision
```
