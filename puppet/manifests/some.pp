class ssh
{
  package { "service/network/ssh": ensure => present }
  service
  {
    ssh:
      ensure => running,
      subscribe => File["/etc/ssh/sshd_config"];
  }
  file
  {
    "/etc/ssh/sshd_config":
      mode   => 444,
      owner  => root,
      group  => root,
      source => "puppet:///modules/ssh/sshd_config",
      require => Package["service/network/ssh"];
  }
}