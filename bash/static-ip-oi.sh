#!/bin/bash
# Set a static IP on OI:

inputs() {
    echo "Please input the IP address you wish to set for this node."
    read IP
    echo "Please enter the default gateway you use on this network."
    read GW
}

disable_nwam() {
    svcadm disable network/physical:nwam
    svcadm enable network/physical:default
}

plumb_int() {
    ifconfig e1000g0 plumb
    ifconfig e1000g0 $IP/24 broadcast + up
}

add_route() {
    route add default $GW
}

wrap_up() {
    echo "The static IP is now set: $IP with gateway $GW"
    ipconfig -a && netstat -rn
}

inputs
disable_nwam
plumb_int
add_route
wrap_up
