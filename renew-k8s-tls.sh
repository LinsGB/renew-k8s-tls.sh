#!/bin/bash
CERT=$1
TLS_NAME=$2

certbot renew
cat /etc/letsencrypt/live/$CERT/privkey.pem > /opt/certs/dev/$CERT.key
cat /etc/letsencrypt/live/$CERT/fullchain.pem > /opt/certs/dev/$CERT.crt
kubectl delete secret $TLS_NAME
kubectl create secrete tls $TLS_NAME --key /opt/certs/dev/$TLS_NAME.key --cert /opt/certs/dev/$TLS_NAME.crt
