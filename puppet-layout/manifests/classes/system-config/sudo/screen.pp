class zumicloud-basenode {
    $enhancers = [ "SUNWscreen", "SUNWsudor" ]
    package { $enhancers: ensure => "installed" }
}
