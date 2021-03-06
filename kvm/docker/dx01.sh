/usr/bin/qemu-kvm \
        -boot cd \
        -enable-kvm \
        -vnc 0.0.0.0:1 \
        -smp 1 \
        -m 1024 \
        -no-hpet \
        -localtime \
        -drive file=/dev/zvol/rdsk/rpool/kvm/lx01,if=ide,index=0 \
        -drive file=/home/scoday/isos/debian/deb871net.iso,media=cdrom,if=ide,index=2  \
        -net nic,vlan=0,name=net0,model=e1000,macaddr=$MAC \
        -net vnic,vlan=0,name=net0,ifname=vnic0,macaddr=$MAC \
        -vga std
