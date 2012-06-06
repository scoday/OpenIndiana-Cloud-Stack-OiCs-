#!/bin/bash
#
# This is a shell script to add a zone to the box:

start() {
    echo "Please enter the ZONE name. Suggest naming the ZONE the HOSTNAME."
    echo ">> "
    read zone
    echo "Please enter the ZONE ip addres. (Format: 192.168.1.20/24"
    read ip
}

build_file() {
    echo "create -b" >> $zone.conf
    echo "set zonepath = /rpool/us-west/$zone" >> $zone.conf
    echo "set autoboot = true" >> $zone.conf
    echo "add net"  >> $zone.conf
    echo "set address = $ip" >> $zone.conf
    echo "set physical = e1000g0" >> $zone.conf
    echo "end" >> $zone.conf
    echo "verify" >> $zone.conf
    echo "commit" >> $zone.conf    
}

#create -b
#set zonepath = /rpool/us-west/sf-app01
#set autoboot = true
#add net
#set address = 192.168.1.10/24
#set physical = e1000g0
#end
#add attr
#set name = comment
#set type = string
#set value = "AppServer to migrate apps off sf-uberdom0."
#end
#verify
#commit
