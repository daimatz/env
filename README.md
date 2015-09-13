# env

create my development environment.

## Local Environment

### Requirements

- Virtualbox
- Vagrant

### Packer template

use [shiguredo/packer-templates](https://github.com/shiguredo/packer-templates).

```sh
git clone https://github.com/shiguredo/packer-templates.git
cd packer-templates/ubuntu-14.04
packer build -only=virtualbox-iso template.json
vagrant box add ubuntu-14-04-x64-virtualbox.box --name ubuntu-1404
```

### Provisioning

use Itame.

```sh
echo '192.168.254.254 dev' | sudo tee -a /etc/hosts
vagrant up
bundle install --path vendor/bundler
bundle exec itamae ssh -h localhost -p 2222 -u vagrant -j itamae/vagrant.json itamae/recipes/*
```
