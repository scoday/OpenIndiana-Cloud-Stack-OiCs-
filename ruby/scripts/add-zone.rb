#!/usr/bin/ruby
#
# This script is designed to automate the deploy of KUMO:
# => This program should get some values for zones and input them
# => the key is to sort out how to have a fully operational zone
# => after that.
#
#zone_defaults = {
#  zone_name:key => "zname", 
#  zone_ipaddr:key => "zipaddr", 
#}
#while line = gets
#	print line
#end

class ZoneCore
	def initialize(name, ip)
		@name = name
		@ip   = String(ip)
	end
end

zone1 = ZoneCore.new("sf-foo", 192.168.1.1)
p zone1

zone2 = ZoneCore.new("sf-foo2", 192.168.1.2)
p zone2

zone3 = ZoneCore.net("sf-foo3", "192.168.1.3")
p zone3
