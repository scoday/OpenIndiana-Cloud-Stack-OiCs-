root@scoi01:~# zonecfg -z znginx01
znginx01: No such zone configured
Use 'create' to begin configuring a new zone.
zonecfg:znginx01> create
zonecfg:znginx01> add net
zonecfg:znginx01:net> set physical=axf0
zonecfg:znginx01:net> set address=192.168.3.250
zonecfg:znginx01:net> end
zonecfg:znginx01> set zonepath=/zones/znginx01
zonecfg:znginx01> verify
zonecfg:znginx01> commit
zonecfg:znginx01> exit
