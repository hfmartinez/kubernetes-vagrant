#!/bin/bash

# Join worker nodes to the Kubernetes cluster
echo "[TASK 1] Join node to Kubernetes Cluster"
bash /vagrant/joincluster.sh 2>/dev/null

echo "===================================="
echo 'run command: vagrant ssh master -c "kubectl get nodes -o wide"'
echo "===================================="