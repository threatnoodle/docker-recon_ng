# vpn container

This is a super basic container that acts as a vpn client. It assumes the
following:

  - this file you're reading right now is on a docker host
  - in this directory you have files called things like 255-255-255-255.ovpn,
    which is an openvpn configuration file.

## Introduction

docker build

    docker build -t vpn:latest .


use configuration management to get your openvpn configurations into this dir.
Then run the shellscript

    ./run_all_containers.sh


Using this you should be able to swiftly build the orchestration that's right
for you.

## Implementation and Workflow

The intention with this is to amass a large number of openvpn configurations,
and create a full mesh of vpn tunnels on all docker hosts. Your imagination
should take you from here.

After running `./run_all_containers.sh`, you should have a number of vpn containers running:

    abc@coreos ~/openvpn $ docker ps
    CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS               NAMES
    b1f87f7ef558        recon-ng            "/bin/bash -c /recon-"   8 hours ago         Up 8 hours                              evil_panini
    ef0d929a0f30        vpn                 "openvpn --config /et"   8 hours ago         Up 8 hours                              vpn-255.255.255.255
    1da00c101f4c        vpn                 "openvpn --config /et"   2 days ago          Up 47 hours                             vpn-256.255.255.255
    89399028caf4        vpn                 "openvpn --config /et"   2 days ago          Up 47 hours                             vpn-257.255.255.255
    e170f591e8df        vpn                 "openvpn --config /et"   2 days ago          Up 47 hours                             vpn-258.255.255.255

for example:

    dib@coreos ~/openvpn $ docker run --rm --net container:vpn-258.255.255.255 -ti recon-ng 
                                                                                            
        _/_/_/    _/_/_/_/    _/_/_/    _/_/_/    _/      _/            _/      _/    _/_/_/
       _/    _/  _/        _/        _/      _/  _/_/    _/            _/_/    _/  _/       
      _/_/_/    _/_/_/    _/        _/      _/  _/  _/  _/  _/_/_/_/  _/  _/  _/  _/  _/_/_/
     _/    _/  _/        _/        _/      _/  _/    _/_/            _/    _/_/  _/      _/ 
    _/    _/  _/_/_/_/    _/_/_/    _/_/_/    _/      _/            _/      _/    _/_/_/    
                                                                                            
    
                                              /\
                                             / \\ /\
            Sponsored by...           /\  /\/  \\V  \/\
                                     / \\/ // \\\\\ \\ \/\
                                    // // BLACK HILLS \/ \\
                                   www.blackhillsinfosec.com
    
                          [recon-ng v4.7.2, Tim Tomes (@LaNMaSteR53)]                       
    
    [80] Recon modules
    [7]  Reporting modules
    [2]  Import modules
    [2]  Exploitation modules
    [2]  Discovery modules
    
    [recon-ng][default] > curl -A "" http://icanhazip.com
    [*] Command: curl -A "" http://icanhazip.com
    258.255.255.255
      % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                     Dload  Upload   Total   Spent    Left  Speed
    100    12  100    12    0     0     41      0 --:--:-- --:--:-- --:--:--    41
    [recon-ng][default] 

In production, you will want to use persistent volumes and strict host firewall.
