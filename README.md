# Cloud Init Scripts

- [OpenVPN Proxy for Testing Traffic](./openvpn/)
- [General Purpose Network Scanner and Discovery](./scanner/)

## Digital Ocean

### Setup

https://cloud.digitalocean.com

- Create API Key: Digital Ocean -> API -> Tokens -> Generate New Token
  - Give it a name like "mytoken"
  - Copy the value and place it in a passwordsafe  
- Create and Download SSH Key: Settings -> Security -> SSH keys as `id_rsa_digital_ocean` in `~/.ssh/`

Install doctl:

```bash
$ sudo snap install doctl
$ sudo snap connect doctl:ssh-keys :ssh-keys
$ #sudo snap connect doctl:dot-docker
$ #sudo snap connect doctl:kube-config
$ doctl auth init #--context contextnamehere
$ #doctl auth switch --context contextnamehere
$ doctl account get
$ doctl compute ssh-key list #find the key ID you will use for droplets
```

VM Sizes:
- s-1vcpu-1gb: $6/month
- s-1vcpu-2gb: $12/month
- s-2vcpu-2gb: $18/month
- There is a smaller one for $4/month, but I've had trouble compiling rust apps on it with that little RAM (500 MB)