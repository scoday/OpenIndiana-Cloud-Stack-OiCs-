/usr/bin/qemu-kvm \
        -enable-kvm \
        -vnc 0.0.0.0:1 \
        -smp 1 \
        -m 512 \
        -no-hpet \
        -localtime \
        -drive file=/dev/zvol/rdsk/rpool/kvm/sconux01/disk0,if=ide,index=0 \
        -net nic,vlan=0,name=net0,model=e1000,macaddr=$MAC \
        -net vnic,vlan=0,name=net0,ifname=vnic0,macaddr=$MAC \
        -vga std
