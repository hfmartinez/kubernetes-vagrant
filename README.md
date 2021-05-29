# Kubernetes Cluster

Simple way to set up a kubernetes cluster with vagrant on virtualbox


## System Prerequisites 📋

The following are the system prerequisites:

* 8Gb of RAM minimum
* 2.4GHz processor or higher
* [Git](https://git-scm.com/downloads) - Git
* [Virtual Box](https://www.virtualbox.org/wiki/Downloads) - Virtualization software.
* [Vagrant](https://www.vagrantup.com/downloads.html) - Virtual machine management tool.

## Install Environment

- Clone the following repository by using this statement:
```
git clone https://github.com/hfmartinez/kubernetes-vagrant.git
```

- Inside the repository folder that contains the Vagrantfile, start the virtual machines: 
```
vagrant up
```

- Run the next command to validate the installation
```
vagrant ssh master -c 'kubectl get nodes -o wide'
```
## Optional Modifications
### Add more workers 
Change NodeCount inside Vagrantfile
```ruby
Vagrant.configure(2) do |config|

  # Change to add more workers
  NodeCount = 1
  
  #global requirements
  config.vm.provision "shell", path: "requirements.sh", :args => NodeCount
```
### Modify RAM and CPU of virtual machines
Change the following parameters inside Vagrantfile
```ruby
#master
master.vm.provider "virtualbox" do |v|
    v.name = "master"
    v.memory = 2048
    v.cpus = 2
end
#workers
worker.vm.provider "virtualbox" do |v|
    v.name = "worker#{i}"
    v.memory = 2048
    v.cpus = 1
end
```
## References
* This repository was forked from [Innablr/K8s_ubuntu](https://github.com/Innablr/k8s_ubuntu)
* Installing Addons for Kubernetes [Installing Addons](https://kubernetes.io/docs/concepts/cluster-administration/addons/)