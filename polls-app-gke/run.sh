#/bin/sh

echo "\n========== Creating the secrets ==========\n"
kubectl create secret generic mysql-root-pass --from-literal=password=R00t
kubectl create secret generic mysql-user-pass --from-literal=username=callicoder --from-literal=password=c@ll1c0d3r
kubectl create secret generic mysql-db-url --from-literal=database=polls --from-literal=url='jdbc:mysql://polling-app-mysql:3306/polls?useSSL=false&serverTimezone=UTC&useLegacyDatetimeCode=false&autoReconnection=true'

echo "\n========== Deploying MySQL ==========\n"
kubectl apply -f deployments/mysql-deployment.yaml

echo "\n========== Deploying the Spring Boot app on Kubernetes ==========\n"
kubectl apply -f deployments/polling-app-server.yaml

echo "\n========== Deploying the React app on Kubernetes ==========\n"
kubectl apply -f deployments/polling-app-client.yaml

# echo "\n========== ingress ==========\n"
# kubectl apply -f deployments/ingress.yaml