#!/bin/bash
#
# Script to automate the install of a Debian Zone:

pkg_install() {
    echo "Install requisite packages."
    pkg install driver/i86pc/kvm system/qemu system/qemu/kvm
}

mount_usb() {
    mount -F pcfs /dev/rdsk/c4t0d0p0 /mnt
}

create_drive() {
    zfs create -p -V 10G rpool/us-west/KVM/debian/disk0
}

vnic() {
    dladm show-vnic | more    

}

bootstrap() {
    VNIC=vnic0
    HD=/rpool/us-west/KVM/debian/disk0
    CD=/rpool/us-west/ISO/debian-6.0.4-amd64-netinst.iso
    VNC=5
    MEM=1024
    MAC=`dladm show-vnic -po macaddress $VNIC`
    /usr/bin/qemu-kvm \
    -boot cd \
    -enable-kvm \
    -vnc 0.0.0.0:$VNC \
    -smp 2 \
    -m $MEM \
    -no-hpet \
    -localtime \
    -drive file=$HD,if=ide,index=0 \
    -drive file=$CD,media=cdrom,if=ide,index=2  \
    -net nic,vlan=0,name=net0,model=e1000,macaddr=$MAC \
    -net vnic,vlan=0,name=net0,ifname=$VNIC,macaddr=$MAC \
    -vga std

}

pkg_install
create_drive
vnic
bootstrap