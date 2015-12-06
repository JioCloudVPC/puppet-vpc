Exec {
  path      => ["/bin/", "/sbin/", "/usr/bin/", "/usr/sbin/", "/usr/local/bin/", "/usr/local/sbin/"],
  logoutput => true
}


node /^ctseed\d+/{
  include rjil::base
  include rjil::redis
  include rjil::cassandra
  include rjil::rabbitmq
  include rjil::zookeeper
}



node /^ct\d+/ {
  include rjil::base
  include rjil::redis
  include rjil::cassandra
  include rjil::rabbitmq
  include rjil::zookeeper
}


node /^haproxy\d+/ {
  include rjil::base
  include rjil::haproxy
#  include rjil::haproxy::contrail
}

node /^httpproxy\d+/ {
  include rjil::base
  include rjil::http_proxy
  dnsmasq::conf { 'google':
    ensure  => present,
    content => 'server=8.8.8.8',
  }
  include rjil::jiocloud::vagrant::dhcp
}



