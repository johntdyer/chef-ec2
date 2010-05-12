#!/bin/sh

# Bootstrap chef

apt-get update
apt-get install -y build-essential

case `uname -m` in
  x86_64)
    REE_DEB="ruby-enterprise_1.8.7-2010.01_amd64.deb"
    ;;
  *)
    REE_DEB="ruby-enterprise_1.8.7-2010.01_i386.deb"
    ;;
esac

cd /tmp
curl -O -L "http://rubyforge.org/frs/download.php/68718/${REE_DEB}"
dpkg -i ${REE_DEB}

gem update --system
gem install chef ohai --no-rdoc --no-ri
mkdir -p /etc/chef
