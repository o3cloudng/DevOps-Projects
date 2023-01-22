# KinD

### To Install Kind
https://kind.sigs.k8s.io/docs/user/quick-start/#installation

## Kind Commands

```
* kind create cluster --name <cluster>

* kind get clusters

* kind delete cluster --name <myCluster>
```

## kubectl Commands

```
* kubectl get nodes

* less ~/.kube/config

* grep server ~/.kube/config

* kubectl config get-contexts

* kubectl config use-context <cluster>
```

Delete Cluster
```
kind delete cluster --name kind-mycluster
```
#
# How to deploy a Multi-Node Cluster in KinD

This will require the use of a configuration file

```
kind create cluster --config "/Users/olumide/Desktop/k8s/DevOps Projects/KinD/kind-config.yaml"
```