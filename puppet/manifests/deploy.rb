class kumo-deploy {
    file { "/var/log/kumo/deploy-node.log" :
      backup => false,
      owner => "jetty",
      group => "jetty",
      mode => 644,
      ensure => present,
      tag => jettyext-01-restart,
      replace => true,
      before => Service["jetty"],
      notify => Service["jetty"],
# Uses optional group      source => "puppet://$server/kumo-deploy/group01/jettyext-01-restart.txt"
      source => "puppet://$server/kumo-deploy/deploy-node.log"
    }
}
