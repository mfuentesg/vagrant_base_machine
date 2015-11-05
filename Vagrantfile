# -*- mode: ruby -*-
require "yaml"

VAGRANTFILE_API_VERSION = "2"
config_file = YAML.load_file("config.yaml")

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = config_file["hostname"]
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "private_network", ip: config_file["ip"]
  config.ssh.private_key_path = [
    config_file['ssh_key_path'],
    "#{ENV["HOME"]}/.vagrant.d/insecure_private_key"
  ]
  
  config.vm.synced_folder config_file["synced_folder"], "/var/www/", 
    :owner => "vagrant", 
    :group => "www-data", 
    mount_options: ["dmode=775,fmode=764"]
  
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", config_file["memory"]]
  end

  config.vm.provision "shell", path: "provision.sh"
end
