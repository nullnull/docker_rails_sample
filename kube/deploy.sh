echo "pushing docker image"
gcloud builds submit --tag gcr.io/gke-sample-201809/rails-gke-sample .

echo "beginnng deployment"
# kubectl delete deployments --all
# kubectl delete pods --all
# kubectl delete services --all
kubectl create -f kube/deploy.yml

echo ""
echo "--- deployment complete! ---"
kubectl get pods
echo ""
echo "if you want to use port-forwarding, please run this command"
echo "$ kubectl port-forward pod/<pod-id> 5900 5900"

# initialize service
# kubectl create -f kube/service.yml
# kubectl get services
