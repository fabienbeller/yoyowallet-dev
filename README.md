# yoyowallet-dev

# Prerequisites:
  - Install Docker Compose (https://docs.docker.com/compose/install/)
  - Install HTTPie (https://github.com/jakubroztocil/httpie)

# Bring up environment
  - ```
    docker-compose up -d
    ```

    

# Get token
  - ```
    http --form post http://127.0.0.1:5000/token \
    username=alice \
    password=password
    ```
    
    

# Create a transaction
  - ```
    http --form post http://127.0.0.1:5000/transactions \
    amount=2000 \
    currency=GBP \
    token=$token-from-get-token-step
    ```
    
    

# Fast transaction
```
USERNAME=alice
PASSWORD=password
AMOUNT=200000
CURRENCY=ZAR
TOKEN=$(http --form post http://127.0.0.1:5000/token username=$USERNAME password=$PASSWORD | jq -r '.token')
http --form post http://127.0.0.1:5000/transactions \
    amount=$AMOUNT \
    currency=$CURRENCY \
    token=$TOKEN
```



------------------------------------------------------------------------------------------

# Extra fun experiment with Minikube
# Minikube

# Prerequisites:
- Minikube (https://kubernetes.io/docs/tasks/tools/install-minikube/)

# Bring up environment
```
minikube kubectl -- apply -f k8s/namespace.yaml
minikube addons enable ingress
minikube kubectl -- apply -f k8s/.
minikube kubectl -- get ingress -n yoyo
```



# Fast transaction
```
USERNAME=alice
PASSWORD=password
AMOUNT=200000
CURRENCY=ZAR
TOKEN=$(http --form post http://$(minikube kubectl -- get ingress -n yoyo -o jsonpath="{..status.loadBalancer.ingress[0]['hostname','ip']}")/token username=$USERNAME password=$PASSWORD | jq -r '.token')
http --form post http://$(minikube kubectl -- get ingress -n yoyo -o jsonpath="{..status.loadBalancer.ingress[0]['hostname','ip']}")/transactions \
    amount=$AMOUNT \
    currency=$CURRENCY \
    token=$TOKEN
```

