# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "ubuntu/trusty32"
    config.vm.box_check_update = false
    config.vm.network "forwarded_port", guest: 8000, host: 8000, auto_correct: true
    config.vm.network "forwarded_port", guest: 5432, host: 5432, auto_correct: true
    config.vm.provider "virtualbox" do |v|
        v.memory = 512
        v.cpus = 1
    end
    config.vm.provision :shell, :path => "install/install.sh"
end
