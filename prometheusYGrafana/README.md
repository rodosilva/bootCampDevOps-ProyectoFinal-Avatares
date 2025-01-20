### 5. Prometheus & Grafana: Monitorizando los Recursos de Kubernetes
Ya tenemos a la aplicación de `Avatares` desplegada en `Kubernetes` y observable desde una URL externa.

Es momento de monitorear. Para ello utilizaremos `Prometheus` para la obtención de métricas y `Grafana` para tener una interfaz de usuario más amigable.

#### Requisitos
- **Helm**: Preferible v3.16.3

#### Pasos
##### 5.1 Añadir el repositorio de prometheus-community
Antes que nada, deberemos añadir de forma local el repositorio de `prometheus-community` y así tener los recursos necesarios para el despliegue que viene en el siguiente paso.
```bash
$ helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
```

##### 5.2 Desplegar Prometheus y Grafana en nuestro cluster
Ahora desplegamos los recursos necesarios para la correcta ejecución de `Prometheus` y `Grafana` en nuestro cluster
```bash
$ helm install prometheus-stack prometheus-community/kube-prometheus-stack --namespace=monitoring --create-namespace
```

**_Opcional_**:
Si quisiéramos tener el template de forma local podríamos usar el siguiente comando:
```bash
$ helm template prometheus-stack prometheus-community/kube-prometheus-stack --namespace=monitoring --create-namespace > prometheus-stack.yaml
```

##### 5.3 Editar el servicio de Grafana para poder entrar de forma externa
Este paquete de la comunidad por defecto no genera una URL externa para que podamos ingresar a `Grafana`

Para ello deberemos editar el servicio
```bash
$ kubectl edit service -n monitoring prometheus-stack-grafana
```
Dado que para este laboratorio no estamos usando certificado, también cambiaremos el puerto `80` por por ejemplo el `5270`
```
[...]
  ports:
  - name: http-web
    port: 5270
    protocol: TCP
    targetPort: 3000
  selector:
    app.kubernetes.io/instance: prometheus-stack
    app.kubernetes.io/name: grafana
  sessionAffinity: None
  type: LoadBalancer
[...]
```

##### 5.4 Ingresando a Grafana
Finalmente ya podemos ingresar a `Grafana`.
Para ello revisaremos la URL se muestra desde el servicio:
```bash
kubectl get services -n monitoring
```

E ingresaremos a una URL my parecida a esta:
`http://:5270`

Dado que hemos usado los valores por defecto del paquete de `prometheus-community/kube-prometheus-stack`, las credenciales para ingresar son:
```
Usuario: admin
Password: prom-operator
```

**_Opcional:_**
Si quisiéramos obtener dichos valores por defecto, podemos revisar el archivo de la siguiente forma:
```bash
$ helm show values prometheus-community/kube-prometheus-stack > prometheus-default-values.yaml
```

Hemos llegado al final, `Grafana` cuenta con sus plantillas. En nuestro caso utilizaremos la de `Kubernetes - Pods` con lo que podemos ver las métricas en forma gráfica