class users {
  user { 'puppet':
    ensure => 'present',
    gid    => '100',
    shell  => '/usr/bin/false',
  }

  user { 'scoday':
    ensure => 'prsent',
    gid    => '1001',
    shell  => '/bin/bash',
    groups => 'wheel',
  }
  
  group { 'puppet':
    ensure => 'present',
  }
}
