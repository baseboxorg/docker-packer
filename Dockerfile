# Packer Dockerfile
#
# https://github.com/rosstimson/dockerfiles
#
# AUTHOR:   Ross Timson <ross@rosstimson.com>
# LICENSE:  WTFPL - http://wtfpl.net
#
# Installs Packer and Ruby (via ruby-install) on CentOS.
#
# Docker:         https://www.docker.io
# Packer:         http://www.packer.io
# ruby-install:   https://github.com/postmodern/ruby-install

# Pull base image
FROM rosstimson/centos
MAINTAINER Ross Timson <ross@rosstimson.com>

# Install development tools needed to compile programs.
RUN yum groupinstall -y "Development tools"

# Packer is supplied as a zip file.
RUN yum install -y unzip

# Download and install Packer.
RUN mkdir /tmp/packer                                                         ;\
    cd /tmp/packer                                                            ;\
    wget -O packer.zip https://dl.bintray.com/mitchellh/packer/0.5.2_linux_amd64.zip ;\
    unzip packer.zip                                                          ;\
    mv packer* /usr/local/bin                                                 ;\
    rm -rf /tmp/packer

# Needed for commonly used gems such as Nokogiri
RUN yum install -y libxml2-devel libxslt-devel

# Download and install ruby-install
RUN mkdir /tmp/ruby-install                                                   ;\
    cd /tmp/ruby-install                                                      ;\
    wget -O ruby-install.tar.gz https://github.com/postmodern/ruby-install/archive/v0.4.1.tar.gz ;\
    tar xzf ruby-install.tar.gz                                               ;\
    cd ruby-install-0.4.1 && make install                                     ;\
    rm -rf /tmp/ruby-install

# Install latest Ruby, update Rubygems, and install Bundler.
RUN ruby-install -i /usr/local ruby stable                                    ;\
    gem install bundler --no-ri --no-rdoc

# Define default command.
CMD ["packer"]
