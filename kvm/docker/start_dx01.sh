#!/usr/bin/bash
#MAC='$(dladm show-vnic -po macaddress dnic0)'
/usr/bin/qemu-kvm \
	-boot cd \
	-enable-kvm \
	-vnc 0.0.0.0:1 \
	-smp 2 \
	-m 1024 \
	-no-hpet \
	-localtime \
	-drive file=/dev/zvol/rdsk/rpool/kvm/lx01,if=ide,index=0 \
	-net nic,vlan=0,name=net0,model=e1000,macaddr=2:8:20:28:fe:c7 \
	-net vnic,vlan=0,name=net0,ifname=dnic0,macaddr=2:8:20:28:fe:c7 \
	-vga std
