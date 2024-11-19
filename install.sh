#!/bin/bash

echo 'creating namespace monitoring ...'
kubectl create namespace monitoring

echo 'installing prometheus ...'
cd prometheus
kubectl apply -f prometheus-config.yaml
kubectl apply -f prometheus-deployment.yaml
kubectl apply -f prometheus-service.yaml
kubectl apply -f prometheus-ingress.yaml
cd ..

echo 'installing loki ...'
cd loki
kubectl apply -f loki-config.yaml
kubectl apply -f loki-deployment.yaml
kubectl apply -f loki-service.yaml
kubectl apply -f loki-ingress.yaml
cd ..

echo 'installing promtail ...'
cd promtail
kubectl apply -f promtail-config.yaml
kubectl apply -f promtail-deployment.yaml
kubectl apply -f promtail-service.yaml
kubectl apply -f promtail-ingress.yaml
cd ..

echo 'installing grafana ...'
cd grafana
kubectl apply -f grafana-deployment.yaml
kubectl apply -f grafana-service.yaml
kubectl apply -f grafana-ingress.yaml
cd ..

echo 'installing node-exporter ...'

kubectl apply -f node-exporter-deployment.yaml

cd front
kubectl apply -f front-deployment.yaml
kubectl apply -f front-service.yaml
kubectl apply -f front-ingress.yaml


echo 'Done'