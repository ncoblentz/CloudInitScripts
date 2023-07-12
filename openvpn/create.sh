#!/bin/bash
ssh-add ~/.ssh/id_rsa_digital_ocean
export DOSSHKEYID=`doctl compute ssh-key list | grep Kali | grep -Eo '^[0-9]+'`
doctl compute droplet create --image ubuntu-22-10-x64 --size s-1vcpu-1gb --region nyc1 --ssh-keys $DOSSHKEYID --user-data-file digital_ocean_openvpn_cloud_config.yaml openvpn
while true; do export DROPLETIPADDRESS=`doctl compute droplet list --no-header --format PublicIPv4 openvpn`; if [ -z "$DROPLETIPADDRESS" ]; then sleep 2; else echo "Public IP: $DROPLETIPADDRESS"; break; fi; done
while true; do scp -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa_digital_ocean root@$DROPLETIPADDRESS:/root/default.ovpn ~/Desktop/; if [ $? -eq 0 ]; then break; else sleep 2; fi; done