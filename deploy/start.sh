#!/bin/bash

# Iterate through the projects and run k6 tests
declare -A projects=(
  ["k8s"]=1
  ["example"]=0
)

for project in "${!projects[@]}"; do
  if [[ "${projects[$project]}" -eq 1 ]]; then
    echo "Running k6 tests for project: $project"
    k6 run "k6/$project/test_plan.js"
    if [ $? -eq 0 ]; then
      echo "k6 tests for $project completed successfully."
    else
      echo "k6 tests for $project failed."
    fi
  else
    echo "Skipping tests for project: $project (disabled)"
  fi
done
