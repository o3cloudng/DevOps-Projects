#  EKS Cluster using Terraform MODULES 

## (AWS Load Balancer Controller + Autoscaler + IRSA)

To update kubeconfig use this command

aws eks update-kubeconfig --name <cluser name> --region <region name>
eg
aws eks update-kubeconfig --name my-eks-cluster --region us-east-1