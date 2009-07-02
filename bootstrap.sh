#!/bin/sh

# Bootstrap chef

apt-get update
apt-get install -y rdoc ruby1.8-dev
cd /tmp
curl -L 'http://rubyforge.org/frs/download.php/57643/rubygems-1.3.4.tgz' | tar xvz
cd rubygems-1.3.4
ruby setup.rb
ln -s gem1.8 /usr/bin/gem
cd
gem install chef ohai --source http://gems.opscode.com --source http://gems.rubyforge.org --no-rdoc --no-ri
mkdir -p /etc/chef
