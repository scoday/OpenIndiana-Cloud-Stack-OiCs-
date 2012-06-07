class sudo
{
  file
  {
    "/etc/sudoers":
      mode   => 444,
      owner  => root,
      group  => root,
      source => "puppet:///modules/sudo/sudoers"
#      require => Package["security/sudo"];
  }

#  service
#  {
#    sudo:
#      subscribe => File["/etc/sudoers"];
#  }
}
