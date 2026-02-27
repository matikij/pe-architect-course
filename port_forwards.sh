#!/bin/bash

kubectl port-forward -n engineering-platform svc/teams-api-service 8080:8080 &
kubectl port-forward -n monitoring svc/grafana-stack 3000:80 &
kubectl port-forward -n engineering-platform svc/teams-ui-service 4200:4300 &
kubectl port-forward -n keycloak svc/keycloak-service 4444:8080 &

