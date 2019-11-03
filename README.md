# env

Create my development environment.

## Provisioning

Use MItame.
https://github.com/k0kubun/mitamae

```sh
v=$(curl -I https://github.com/itamae-kitchen/mitamae/releases/latest | grep Location | awk -F'tag/' '{print $2}' | sed -e 's/\r$//')
wget https://github.com/k0kubun/mitamae/releases/download/$v/mitamae-x86_64-linux -O mitamae
chmod +x mitamae
./mitamae local -j itamae/dai.json itamae/adduser.rb
./mitamae local -j itamae/dai.json itamae/base/*
```

## SSH forwarding

When you use remote machine, use SSH forwarding to be useful.

### Local Forward

Forwading local access to remote:

```
ssh -L 1234:localhost:4321 <remote_host>

# From remote machine
python -m SimpleHTTPServer 4321
# Access localhost:1234 from local browser to see files in remote directory
```

Accessing internet from remote via local machine:

```
ssh -L 2345:api.ipify.org:80 <remote_host>

# From local machine
curl -H 'Host: api.ipify.org' localhost:2345
# to see your REMOTE MACHINE IP address.
```

Write ~/.ssh/config to use configuration above automatically.

```
Host remote_host
  LocalForward 1234 localhost:4321
  LocalForward 2345 api.ipify.org:80
```

### Remote Forward

Forwading remote access to local:

```
# From local machine
python -m SimpleHTTPServer 6543

# From another shell
ssh -R 3456:localhost:6543 <remote_host>

# From remote machine
curl localhost:3456
# to see files in local directory
```

Accessing internet from remote via local machine:

```
# SSH to remote machine using -R option
ssh -R 4567:api.ipify.org:80 <remote_host>

# Show IP address from remote machine
curl -H 'Host: api.ipify.org' localhost:4567
# to see your LOCAL MACHINE IP address.
````

Write ~/.ssh/config to use configuration above automatically.

```
Host remote_host
  RemoteForward 3456 localhost:6543
  RemoteForward 4567 api.ipify.org:80
```

### AutoSSH

Reconnect to remote server automatically using AutoSSH.

```
brew install autossh
autossh -M 60000 <remote_host>
```
