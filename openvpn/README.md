# OpenVPN Instructions

## Digital Ocean

```bash
$ doctl compute droplet create --image ubuntu-22-10-x64 --size s-1vcpu-1gb --region nyc1 --ssh-keys 38070866 --user-data-file cloud_config.yaml openvpn
$ watch doctl compute droplet list
$ export DROPLETIPADDRESS=`doctl compute droplet list openvpn --format PublicIPv4 --no-header`
$ ssh -i ~/.ssh/id_rsa_digital_ocean root@$DROPLETIPADDRESS
$ tail -f /var/log/cloud-init-output.log #see and debug issues with cloud init script
$ exit
$ scp -i ~/.ssh/id_rsa_digital_ocean root@$DROPLETIPADDRESS:/root/default.ovpn .
$ sudo openvpn default.ovpn # traffic will now tunnel through OpenVPN box
$ # Clean up when all done
$ doctl compute droplet delete openvpn
```

## References

- https://cloudinit.readthedocs.io/en/latest/reference/examples.html