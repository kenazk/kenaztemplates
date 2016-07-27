#! /bin/sh

sed -i "2i$1 $2" /etc/hosts
curl -k https://$2:8140/packages/current/install.bash | sudo bash
