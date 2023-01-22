# Kubernetes Configuration Files

* Deployments
* Service
* Secret
* Ingress
* Config map



## How To connect to An AWS EKS Cluster

```
aws configure --profile myuser

aws sts get-caller-identity
```

```
aws eks --region <region> update-kubeconfig --name <cluster-name>
```

## KUBECTL Commands
```
* kubectl get ns

* kubectl get nodes

* kubectl get svc

* kubectl get pods

* kubectl describe <pod> or <svc> or <services>

* kubectl get contexts

* kubectl config use-context

* less ~/.kube/config

* grep server ~/.kube/config

* kubectl config get-contexts

* kubectl config use-context <cluster>

```