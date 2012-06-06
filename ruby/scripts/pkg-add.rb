#!/usr/bin/ruby
# Just to work around puppet's Solaris support.
#
   pkg = "sudo"

  [ "pkg install #{pkg}" ].each do |command|
    puts command
    system(command)
  end