#!/bin/sh

# Bootstrap chef

RUBYGEM_VERSION="1.3.5"

apt-get update
apt-get install -y rdoc ruby1.8-dev build-essential
cd /tmp
curl -L "http://rubyforge.org/frs/download.php/57643/rubygems-${RUBYGEM_VERSION}.tgz" | tar xvz
cd rubygems-${RUBYGEM_VERSION}
ruby setup.rb --no-rdoc --no-ri
ln -s gem1.8 /usr/bin/gem
cd
gem update --system
gem install chef ohai --source http://gems.opscode.com --source http://gems.rubyforge.org --no-rdoc --no-ri
mkdir -p /etc/chef
