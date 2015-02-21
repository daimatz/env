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
sudo apt-get install python-pip sshpass
sudo pip install ansible
vagrant up
```

then automatically provisions.

If you want to run `ansible-playbook` manually, run:

```sh
ansible-playbook \
    --private-key=.vagrant/machines/default/virtualbox/private_key \
    --user=vagrant \
    --inventory-file=ansible/hosts \
    ansible/site.yml
```
