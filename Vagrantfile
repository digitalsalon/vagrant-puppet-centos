# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

  config.vm.box = "centos64"
  config.vm.box_url = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130309.box"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file  = "centos.pp"
    puppet.module_path = "modules"
  end

  config.vm.define :backup do |backup_config|
    backup_config.vm.network :hostonly, "192.168.0.11"
    backup_config.vm.host_name = "backup"
  end

  config.vm.define :hadoop1 do |hadoop1_config|
    hadoop1_config.vm.network :hostonly, "192.168.0.12"
    hadoop1_config.vm.host_name = "hadoop1"
  end

  config.vm.define :hadoop2 do |hadoop2_config|
    hadoop2_config.vm.network :hostonly, "192.168.0.13"
    hadoop2_config.vm.host_name = "hadoop2"
  end

  config.vm.define :hadoop3 do |hadoop3_config|
    hadoop3_config.vm.network :hostonly, "192.168.0.14"
    hadoop3_config.vm.host_name = "hadoop3"
  end

   config.vm.define :master do |master_config|
    master_config.vm.network :hostonly, "192.168.0.10"
    master_config.vm.host_name = "master"
    master_config.vm.forward_port 50070, 50070
  end
end
