#!/bin/bash

# installation
# curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
# sudo install minikube-linux-amd64 /usr/local/bin/minikube

# curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
# sudo install kubectl /usr/local/bin/kubectl

# minikube setup
minikube stop
minikube delete
minikube start --kubernetes-version v1.19.3 --driver=virtualbox --cpus 4 --disk-size='4g'

kubectl apply -f manifests/

kubectl rollout status statefulset/mongo


kubectl expose pod mongo-0 --port 27017 --target-port 27017 --type LoadBalancer
kubectl expose pod mongo-1 --port 27017 --target-port 27017 --type LoadBalancer
kubectl expose pod mongo-2 --port 27017 --target-port 27017 --type LoadBalancer
