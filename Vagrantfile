# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  # Change to add more workers
  NodeCount = 1
  Provider = "vmware_desktop" # change if needed
  
  # global requirements
  config.vm.provision "shell", path: "requirements.sh", :args => NodeCount
  config.vm.box = "bento/ubuntu-22.04-arm64" # change if needed 

  # Kubernetes Master
  config.vm.define "master" do |master|
    master.vm.hostname = "master"
    master.vm.network "private_network", ip: "192.168.10.100"
    master.vm.provider Provider do |v|
      v.memory = 4096
      v.cpus = 4
      v.gui = true
    end
    master.vm.provision "shell", path: "master.sh"
    master.vm.box_download_insecure = true
  end

  (1..NodeCount).each do |i|
    config.vm.define "worker#{i}" do |worker|
      worker.vm.hostname = "worker#{i}"
      worker.vm.network "private_network", ip: "192.168.10.#{i+1}"
      worker.vm.provider Provider do |v|
        v.memory = 4096
        v.cpus = 2
        v.gui = true
      end
      worker.vm.provision "shell", path: "worker.sh"
      worker.vm.box_download_insecure = true
    end
  end
end