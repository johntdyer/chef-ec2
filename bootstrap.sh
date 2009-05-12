#!/bin/sh

# Bootstrap chef

apt-get update
apt-get install -y rdoc ruby-dev
cd /tmp
curl -L 'http://rubyforge.org/frs/download.php/56227/rubygems-1.3.3.tgz' | tar zxv
cd rubygems-1.3.3
ruby setup.rb
ln -s /usr/bin/gem1.8 /usr/bin/gem
cd
gem1.8 install chef ohai --source http://gems.opscode.com --source http://gems.rubyforge.org
mkdir -p /etc/chef
