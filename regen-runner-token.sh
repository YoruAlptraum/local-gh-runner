#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Fetch a new ephemeral runner registration token
# Ensure your GITHUB_PAT and REPO_URL environment variables are set.
# This example uses a repository-level runner token endpoint.
TOKEN=$(curl -s -X POST -H "Authorization: token ${GITHUB_PAT}" \
  -H "Accept: application/vnd.github.v3+json" \
  "${REPO_URL}/actions/runners/registration-token" \
  | jq -r .token)

# Configure and run the runner with the new token
# The --unattended flag prevents the script from asking for user input.
# The --replace flag replaces an existing runner with the same name.
/home/docker/actions-runner/config.sh \
  --unattended \
  --url "${REPO_URL}" \
  --token "${TOKEN}" \
  --replace \
  --name "my-docker-runner-$(hostname)"

# Start the runner
/home/docker/actions-runner/run.sh