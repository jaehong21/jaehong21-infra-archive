helm repo add jetstack https://charts.jetstack.io
helm repo update
curl -L -o cert-manager.yml https://github.com/cert-manager/cert-manager/releases/download/v1.8.0/cert-manager.crds.yaml
kubectl apply -f cert-manager.yml
helm install \
cert-manager jetstack/cert-manager \
--namespace cert-manager \
--create-namespace \
--version v1.8.0
kubectl get pods --namespace=cert-manager