task :host do |t|
  unless ENV['SERVER']
    raise "You must specify a host via the SERVER variable"
  end
end

task :sync => :host do |t|
  sh "rsync -Cavz . #{ENV['SERVER']}:/etc/chef"
end

task :bootstrap => [:sync, :host] do |t|
  sh "ssh #{ENV['SERVER']} '/etc/chef/bootstrap.sh'"
end

task :update => [:sync, :host] do |t|
  sh "ssh #{ENV['SERVER']} 'chef-solo -j /etc/chef/dna/#{ENV['SERVER']}.json'"
end
