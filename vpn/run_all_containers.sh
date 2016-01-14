#!/usr/bin/env bash

set -x

docker images | grep "^vpn .*latest" > /dev/null 2>&1 ||
  docker build -t vpn .

for conf_file in *.ovpn; do

  # transform '255-255-255-255.ovpn' into the string '255.255.255.255' and look
  # for the remote name in the openvpn configuration file. This is so we can
  # map /etc/hosts and prevent a DNS query.
  tmp="${conf_file//.ovpn}"
  remote_ip="${tmp//-/.}"
  remote_name="$(awk '/^remote /{print $2}' ${conf_file})"

  # TODO: figure out how to keep the remote VMs awake
  # TODO: Note that we map /etc/hosts; this is critical.
  # TODO: create strict firewall rules so that in the event of a compromise,
  # the attacker has limited mobility.
  docker run \
    --restart always \
    --add-host ${remote_name}:${remote_ip} \
    --dns 8.8.8.8 \
    --dns-search local \
    -d -t -v $(pwd):/etc/openvpn \
    --device /dev/net/tun:/dev/net/tun \
    --cap-add NET_ADMIN \
    --name "vpn-${tmp}" \
    -i vpn --config /etc/openvpn/${conf_file} 2>/dev/null

done #<3
