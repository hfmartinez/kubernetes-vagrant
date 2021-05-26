# Kubernetes Cluster

Simple way to set up a kubernetes cluster with vagrant on virtualbox


## System Prerequisites 📋

The following are the system prerequisites:

* 8Gb of RAM at least
* 2.4GHz processor or higher
* [Git](https://git-scm.com/downloads) - Git
* [Virtual Box](https://www.virtualbox.org/wiki/Downloads) - Virtualization software.
* [Vagrant](https://www.vagrantup.com/downloads.html) - Virtual machine management tool.

## Install Environment

- Clone the following repository by using the statement:
```
git clone https://github.com/hfmartinez/kubernetes-vagrant.git
```

- Inside the repository folder that contains the Vagrantfile, start the virtual machines: 
```
vagrant up
```

- Enter to master machine
```
vagrant ssh master
```

- Run the next command to validate the installation
```
kubectl get nodes
```

## References
This repository forked from [K8s_ubuntu](https://github.com/Innablr/k8s_ubuntu)