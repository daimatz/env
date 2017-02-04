# env

create my development environment.

## Provisioning

use MItame.
https://github.com/k0kubun/mitamae

```sh
echo '192.168.254.254 dev' | sudo tee -a /etc/hosts
vagrant up
wget https://github.com/k0kubun/mitamae/releases/download/v*.*.*/mitamae-* -O mitamae
chmod +x mitamae
./mitamae local -j itamae/vagrant.json itamae/base/*
```
