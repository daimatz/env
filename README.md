# env

create my development environment.

## Provisioning

use MItame.
https://github.com/k0kubun/mitamae

```sh
v=$(curl -I https://github.com/itamae-kitchen/mitamae/releases/latest | grep Location | awk -F'tag/' '{print $2}' | sed -e 's/\r$//')
wget https://github.com/k0kubun/mitamae/releases/download/$v/mitamae-x86_64-linux -O mitamae
chmod +x mitamae
./mitamae local -j itamae/dai.json itamae/adduser.rb
./mitamae local -j itamae/dai.json itamae/base/*
```
