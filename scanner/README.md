# Scanner Instructions

## Digital Ocean

```bash
$ doctl compute droplet create --image ubuntu-22-10-x64 --size s-1vcpu-1gb --region nyc1 --ssh-keys 38070866 --user-data-file digital_ocean_scanner_cloud_config.yaml scanner
$ watch doctl compute droplet list
$ export DROPLETIPADDRESS=`doctl compute droplet list scanner --format PublicIPv4 --no-header`
$ ssh -i ~/.ssh/id_rsa_digital_ocean root@$DROPLETIPADDRESS
$ tail -f /var/log/cloud-init-output.log #see and debug issues with cloud init script
$ exit
$ #scp -i ~/.ssh/id_rsa_digital_ocean Tools/Discovery/passivesubdomainenum Tools/Discovery/subdomainwordlist.txt root@$DROPLETIPADDRESS:/root/
$ # Cleanup when all done
$ doctl compute droplet delete scanner
```

## Reference

- https://cloudinit.readthedocs.io/en/latest/reference/examples.html