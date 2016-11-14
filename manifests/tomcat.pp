# Tomcat requires JDK7+
class { 'java': }

# Install and run tomcat8
tomcat::install { '/opt/tomcat':
  source_url => 'http://apache-mirror.rbc.ru/pub/apache/tomcat/tomcat-8/v8.5.8/bin/apache-tomcat-8.5.8.tar.gz',
}
tomcat::instance { 'tomcat':
  catalina_home => '/opt/tomcat',
}

# Configure connector on 8080 port, disable HTTPS redirect port
tomcat::config::server::connector { 'tomcat-http':
  catalina_base         => '/opt/tomcat',
  port                  => '8080',
  protocol              => 'HTTP/1.1',
  attributes_to_remove => {
       'redirectPort'   => '8443'
 },
}
