kubectl delete secret regcred --namespace doggly
kubectl create secret docker-registry regcred \
  --docker-server=193362923626.dkr.ecr.ap-northeast-2.amazonaws.com \
  --docker-username=AWS \
  --docker-password=$(aws ecr get-login-password --profile sigor) \
  --namespace=doggly