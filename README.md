# env

create my development environment.

## Provisioning

use MItame.
https://github.com/k0kubun/mitamae

```sh
wget https://github.com/k0kubun/mitamae/releases/download/v*.*.*/mitamae-x86_64-linux -O mitamae
chmod +x mitamae
./mitamae local -j itamae/dai.json itamae/adduser.rb
./mitamae local -j itamae/dai.json itamae/base/*
```
