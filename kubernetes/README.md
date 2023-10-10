# Minikube for local running

## Run minikube with driver qemu for MacOS
```
brew install socket_vmnet
brew tap homebrew/services

HOMEBREW=$(which brew) && sudo ${HOMEBREW} services start socket_vmnet

minikube start --driver qemu --network socket_vmnet --cpus 4 --memory 8g
```

## Linux 
```
minikube start --driver qemu --network socket_vmnet --cpus 4 --memory 8g
```
## Create namespace working on
```
kubectl create ns devops-tools
```

## Config default namespace
```
kubectl config set-context --current --namespace=devops-tools
```

## Minikube Addon Ingress
```
minikube addons enable ingress
```

## Start provision.
```
kubectl apply -k ./kubernetes
```