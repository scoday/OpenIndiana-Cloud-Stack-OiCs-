class sudo
{
  file { "/usr/sbin/sudo-install":
    mode 	=> 777,
    owner 	=> root,
    group 	=> root,
    source 	=> "puppet:///modules/sudo/sudo-install",
  }

  service
  {
    sudo:
      subscribe => File["/etc/sudoers"];
  }
  file
  {
    "/etc/sudoers":
      mode   => 444,
      owner  => root,
      group  => root,
      source => "puppet:///modules/sudo/sudoers",
      require => Package["security/sudo"];
  }
}
