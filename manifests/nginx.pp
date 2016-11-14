# Install nginx
class{'nginx':
    manage_repo => true,
    package_source => 'nginx-mainline'
}

# Configure proxy
::nginx::resource::vhost { 'localhost:8888':
  ensure      => present,
  listen_port => 8888,
  server_name => ['localhost'],
  proxy       => 'http://tomcat',
}

# Configure backend
::nginx::resource::upstream { 'tomcat':
  ensure  => present,
  members => [
        '127.0.0.1:8080'
  ]
}
