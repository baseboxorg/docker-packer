# Packer Dockerfile (rosstimson/packer)

[![Docker Repository on
Quay.io](https://quay.io/repository/rosstimson/packer/status "Docker
Repository on Quay.io")](https://quay.io/repository/rosstimson/packer)

This repository contains a **Dockerfile** to build [Packer][packer] and [ruby-install]
[ruby-install] on CentOS.  It then uses [ruby-install][ruby-install] to install the
latest version of Ruby (MRI) and the Bundler gem.

I primarily use the container that this builds with [Drone][drone] continuous
integration to automate and test the building of custom Amazon AMIs.

## Dependencies

* [My CentOS base container][centos-base]

## Installation

1. Install [Docker][docker]
2. Build image from Dockerfile:
    docker build -t rosstimson/packer github.com/rosstimson/docker-packer

_Where `-t rosstimson/packer` is just a tag for the container, you can name
this as you wish._

## Contact

* Website:  [rosstimson.com][website]
* Email:    [ross@rosstimson.com][email]
* Twitter:  [@rosstimson][twitter]

## License

Released under the [WTFPL](http://wtfpl.net) - Do What the Fuck You Want
to Public License



[website]:        https://rosstimson.com
[email]:          mailto:ross@rosstimson.com
[twitter]:        https://twitter.com/rosstimson

[packer]:         http://www.packer.io
[ruby-install]:   https://github.com/postmodern/ruby-install
[docker]:         https://www.docker.io

[drone]:          https://drone.io

[centos-base]:    https://index.docker.io/u/rosstimson/centos
