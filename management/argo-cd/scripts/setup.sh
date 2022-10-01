# Namespace for ArgoCD
kubectl create namespace argocd

# Install ArgoCD
kubectl kustomize ../manifests/ | kubectl apply -n argocd -f -

# ArgoCD Server type -> LoadBalancer
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'

# ArgoCD Web UI -> get Admin Password
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo