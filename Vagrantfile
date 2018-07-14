Vagrant.configure("2") do |config|
  config.ssh.insert_key = false

  config.vm.define 'server' do |instance|
    instance.vm.box = 'builds/centos-7-x64_lxc.box'
    instance.vm.provider :lxc do |lxc|
      lxc.fetch_ip_tries = 30
    end
  end

  config.vm.define 'minimal' do |instance|
    instance.vm.box = 'builds/centos-7-minimal-x64_lxc.box'
  end

end
