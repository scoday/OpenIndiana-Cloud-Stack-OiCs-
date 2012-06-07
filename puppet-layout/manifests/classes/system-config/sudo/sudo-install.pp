class sudo-install
{
  file { "/usr/sbin/sudo-install":
    mode        => 777,
    owner       => root,
    group       => root,
    source      => "puppet:///modules/sudo/sudo-install",
  }

  exec { "/usr/sbin/sudo-install": }
}
