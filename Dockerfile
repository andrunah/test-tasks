FROM centos:centos7
MAINTAINER Andrey Frolov <afrolov@luxoft.com>

# Install puppet
RUN rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
RUN yum -y update; yum clean all
RUN yes | yum -y install puppet; yum clean all

# Add manifests to image
ADD manifests /etc/puppet/manifests/

# Install puppet modules
RUN puppet module install puppet-nginx --version 0.5.0
RUN puppet module install puppetlabs-java --version 1.6.0
RUN puppet module install puppetlabs-tomcat --version 1.6.0

RUN ln -s /etc/hiera.yaml /etc/puppet/hiera.yaml

# Install and configure nginx and tomcat
RUN puppet apply /etc/puppet/manifests/nginx.pp --verbose
RUN puppet apply /etc/puppet/manifests/tomcat.pp --verbose

# Run nginx and tomcat
CMD ["sh", "-c", "/opt/tomcat/bin/catalina.sh start ; nginx -g 'daemon off;'"]

EXPOSE 8888
