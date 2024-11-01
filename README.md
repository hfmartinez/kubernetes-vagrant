# Kubernetes Cluster Setup

This repository provides a simple way to set up a Kubernetes cluster using Vagrant. It is designed for developers and system administrators who want to quickly create a local Kubernetes environment for testing, learning, or development purposes without the need for complex cloud infrastructure.

## Description

Kubernetes is an open-source container orchestration platform that automates the deployment, scaling, and management of containerized applications. Setting up a Kubernetes cluster can be complex and time-consuming, especially for those who are new to the technology. This repository simplifies that process by leveraging Vagrant, a popular tool for managing virtual machine environments.

### Key Features

- **Easy Setup**: With just a few commands, users can set up a fully functional Kubernetes cluster on their local machines.
- **Customization Options**: Users can easily modify the number of worker nodes, as well as allocate resources such as RAM and CPU, to suit their development needs.
- **Testing and Development**: Ideal for developers who want to test their applications in a Kubernetes environment without needing access to cloud resources.
- **Open Source**: This project is open-source, allowing users to contribute and adapt the setup for their specific requirements.

### Use Cases

- **Learning and Experimentation**: Perfect for those new to Kubernetes who want to learn about container orchestration and practice deploying applications in a Kubernetes environment.
- **Development**: Developers can use this setup to develop and test their containerized applications locally before deploying them to production environments.
- **Demonstrations**: Useful for creating demonstrations of Kubernetes features and capabilities without requiring a cloud provider or extensive infrastructure setup.

By following the instructions in this repository, you can quickly get your own Kubernetes cluster up and running, enabling you to dive into the world of container orchestration with ease.

## Table of Contents

- [System Prerequisites](#system-prerequisites-)
- [Installation Instructions](#installation-instructions)
- [Validating the Installation](#validating-the-installation)
- [Optional Modifications](#optional-modifications)
  - [Add More Workers](#add-more-workers)
  - [Modify RAM and CPU of Virtual Machines](#modify-ram-and-cpu-of-virtual-machines)
- [References](#references)

## System Prerequisites 📋

Before you begin, ensure your system meets the following prerequisites:

- **RAM**: Minimum of 8 GB
- **Processor**: 2.4 GHz or higher
- **Software Requirements**:
  - [Git](https://git-scm.com/downloads) - For version control
  - [Vagrant](https://www.vagrantup.com/downloads.html) - Virtual machine management tool

## Installation Instructions

Follow these steps to set up the Kubernetes cluster:

1. **Clone the Repository**: Use the following command to clone the repository:

```bash
git clone https://github.com/hfmartinez/kubernetes-vagrant.git
```

2. **Start the Virtual Machines**: Navigate to the cloned repository folder (where the `Vagrantfile` is located) and start the virtual machines:

```bash
cd kubernetes-vagrant
vagrant up
```

## Validating the Installation

After the VMs are up, run the following command to validate the installation:

```bash
vagrant ssh master -c 'kubectl get nodes -o wide'
```

## Optional Modifications

### Add More Workers

To increase the number of worker nodes, change the `NodeCount` variable inside the `Vagrantfile`:

```ruby
Vagrant.configure(2) do |config|

  # Change to add more workers
  NodeCount = 2
  Provider = "vmware_desktop" # change if needed
```

### Modify RAM and CPU of Virtual Machines

You can adjust the RAM and CPU allocations for the master and worker nodes by modifying the following parameters in the `Vagrantfile`:

```ruby
# Master Node Configuration
master.vm.provider Provider do |v|
    v.name = "master"
    v.memory = 4096
    v.cpus = 4
end

# Worker Node Configuration
worker.vm.provider Provider do |v|
    v.name = "worker#{i}"
    v.memory = 4096
    v.cpus = 2
end
```

## References

- This repository was forked from [Innablr/K8s_ubuntu](https://github.com/Innablr/k8s_ubuntu)
- Installing Addons for Kubernetes [Installing Addons](https://kubernetes.io/docs/concepts/cluster-administration/addons/)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
