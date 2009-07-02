SSH_OPTIONS={ 'BatchMode' => 'yes', 
  'CheckHostIP' => 'no', 
  'StrictHostKeyChecking' => 'no',
  'UserKnownHostsFile' => '/dev/null' }.map{|k, v| "-o #{k}=#{v}"}.join(' ')

task :host do |t|
  unless ENV['SERVER']
    raise "You must specify a host via the SERVER variable"
  end
end

task :sync => :host do |t|
  sh "rsync -Cavz --delete --rsh='ssh -l root #{SSH_OPTIONS}' #{File.dirname(__FILE__)}/ #{ENV['SERVER']}:/etc/chef"
end

task :bootstrap => [:sync, :host] do |t|
  sh "ssh #{SSH_OPTIONS} -l root #{ENV['SERVER']} '/etc/chef/bootstrap.sh'"
end

task :update => [:sync, :host] do |t|
  sh "ssh #{SSH_OPTIONS} -l root #{ENV['SERVER']} 'chef-solo -j /etc/chef/dna/#{ENV['SERVER']}.json'"
end
