# docker-recon_ng

[LaNMaSteR53's](https://bitbucket.org/LaNMaSteR53/recon-ng) recon-ng in a docker container

## Usage

### Example

    boq@coreos ~/Dockerfiles/recon_ng $ docker run --rm --net container:vpn-256-256-256-256 -ti recon-ng                                                                                                                                                                                 
                                                                                            
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
    
    [recon-ng][default] > curl http://icanhazip.com -A ""
    [*] Command: curl http://icanhazip.com -A ""
    256.256.256.256

### Building

    docker build -t recon-ng .

### Running

    docker run --rm --net container:vpn-256.256.256.256 -ti recon-ng

### Troubleshooting

    docker run --rm -ti recon-ng pip freeze

### Todo

  * work out the best way to make a persistent volume between invocations of recon-ng
  * allow users to load their own modules
  * shrink the base image, maybe swap to a different template or `autoremove`
    * at the same time install more useful tools, like `dig`, `scapy`
