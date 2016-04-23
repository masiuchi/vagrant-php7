# -*- mode: ruby -*-
# vi: set ft=ruby :

# original: http://qiita.com/ayayan-z/items/dde3778376248eaa7d99

Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"
  config.vm.hostname = "centos7.local"
  config.vm.network "private_network", ip: "192.168.33.163"
  config.vm.synced_folder "./", "/vagrant"
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--paravirtprovider", "kvm"]
#    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.provision :shell, :path => "provision.sh"

  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
end
