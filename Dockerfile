FROM centos:centos7
MAINTAINER Andrey Frolov <afrolov@luxoft.com>

RUN yum -y update; yum clean all
RUN yum -y install git; yum clean all
