#!/bin/bash

# Este Script se encarga de realizar los pasos para el correcto despliegue de los recursos de Kubernetes
# Depende de que el Cluster de EKS (Kubernetes) se encuentre ya construido y la autenticación tanto con AWS como con el Cluster sea correcta.

# CONFIGMAP
echo "==========================="
echo "Despliegue de los ConfigMap"
echo "==========================="
kubectl create -f configMapAvataresBack.yaml
kubectl create -f configMapAvataresFront.yaml

echo "============================="
echo "Despliegue de los Deployments"
echo "============================="
kubectl create -f deploymentAvataresBack.yaml
kubectl create -f deploymentAvataresFront.yaml

echo "==========================="
echo "Despliegue de los Services"
echo "==========================="
kubectl create -f serviceAvataresBack.yaml
kubectl create -f serviceAvataresFront.yaml

echo "=============================================="
echo "Mostrando URL del LoadBalancer para ver la APP"
echo "=============================================="
sleep 15
lb=$(kubectl get services | awk 'FNR == 3 {print $4}')
echo "La URL es: http://$lb:5173"
