#!/bin/bash

export $(cat config.env)
export APP_NAME=$1
export APP_VERSION=$2
ENVIRONMENT="${ENVIRONMENT,,}" # Environment to lowercase
export APP_NAMESPACE

echo "--> Application config..."

kubectl create configmap config-env-$APP_NAME --from-env-file=config.env -n $APP_NAMESPACE -o yaml --dry-run=client --save-config | kubectl apply -n $APP_NAMESPACE -f -
echo "--> Application deploy..."
envsubst < deployment.yaml | kubectl apply -n $APP_NAMESPACE -f -
echo "--> Application expose..."
kubectl expose deployment $APP_NAME -n $APP_NAMESPACE --port=80 --target-port=8080 -o yaml --dry-run=client | kubectl apply -n $APP_NAMESPACE -f -
envsubst < istio.yaml | kubectl apply -n $APP_NAMESPACE  -f -
kubectl set env deployment/${APP_NAME} --overwrite ROLLOUT="$(date)" -n ${APP_NAMESPACE}

sleep 20s # Sleep because it has some "pending" seconds
NUMBER_OF_TRIES=0
ROLLOUT_CK="kubectl rollout status deployment/${APP_NAME} -n ${APP_NAMESPACE}"
until $ROLLOUT_CK || [ $NUMBER_OF_TRIES -eq 15 ]; do
    $ROLLOUT_CK
    NUMBER_OF_TRIES=$((NUMBER_OF_TRIES + 1))
    sleep 20s
done

if ! kubectl rollout status deployment/${APP_NAME} -n ${APP_NAMESPACE}; then
    echo "--> Rollout failed. Please, check application logs"
    RC=1
else
    echo "--> Rollout completed successfully!"
    RC=0
fi

echo "RC=${RC}"
exit $RC
