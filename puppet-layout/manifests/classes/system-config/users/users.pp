user { 'scoday':
    uid => '1001',
    ensure => 'present',
    gid => '0',
    home => '/export/home/scoday',
    shell => '/bin/bash'
}
