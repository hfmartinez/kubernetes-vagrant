# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  # Change to add more nodes
  NodeCount = 3
  Provider = "virtualbox" # change if needed
  
  # global requirements
  # config.vm.provision "shell", path: "requirements.sh", :args => NodeCount
  config.vm.box = "bento/ubuntu-22.04" # change if needed 

  # Kubernetes controlplane
  config.vm.define "control-plane" do |controlplane|
    controlplane.vm.hostname = "controlplane"
    controlplane.vm.network "private_network", ip: "192.168.10.100"
    controlplane.vm.provider Provider do |v|
      v.memory = 4096
      v.cpus = 4
      v.gui = true
    end
    # controlplane.vm.provision "shell", path: "controlplane.sh"
    controlplane.vm.box_download_insecure = true
  end

  (1..NodeCount).each do |i|
    config.vm.define "node_#{i}" do |node|
      node.vm.hostname = "node#{i}"
      node.vm.network "private_network", ip: "192.168.10.#{i+1}"
      node.vm.provider Provider do |v|
        v.memory = 4096
        v.cpus = 2
        v.gui = true
      end
      # node.vm.provision "shell", path: "node.sh"
      node.vm.box_download_insecure = true
    end
  end
end