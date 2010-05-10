#!/bin/sh

# Bootstrap chef

RUBYGEM_VERSION="1.3.6"

apt-get update
apt-get install -y rdoc ruby1.8-dev build-essential
cd /tmp
curl -L "http://production.cf.rubygems.org/rubygems/rubygems-${RUBYGEM_VERSION}.tgz" | tar xvz
cd rubygems-${RUBYGEM_VERSION}
ruby setup.rb --no-rdoc --no-ri
ln -s `which gem1.8` /usr/bin/gem
cd
gem update --system
gem install chef ohai --no-rdoc --no-ri
mkdir -p /etc/chef
