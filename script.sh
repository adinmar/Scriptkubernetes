#!/bin/bash

# Get the list of pods
pods=$(kubectl get pods --all-namespaces)

# Iterate over the pods
while read -r pod; do
  # Get the state of the current pod
  state=$(echo $pod | awk '{print $4}')

  # Check if the state is not "Running"
  if [ "$state" != "Running" ]; then
    # Send notification email
#    mail -s "Kubernetes Pod Alert" adina.marin@emea.nttdata.com <<EOF
    mail -s "Kubernetes Pod Alert" gio.marin@yahoo.com <<EOF
A Kubernetes pod is not in the "Running" state:

$pod
EOF
  fi
done <<< "$pods"