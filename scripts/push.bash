#!/usr/bin/env bash

# Builds a container image and pushes it to an AWS ECR repository
#
# Usage:
#
# ./push.bash <source path> <repository url> [<tag 1> ... <tag n>]
# ./push.bash ../src 123456789012.dkr.ecr.us-west-1.amazonaws.com/optional-namespace/hello-world latest [another-tag] ... [tag-n]
#

set -e

cmd="${DOCKER_CMD:-docker}"

SOURCE_PATH="${1}"
REPOSITORY_URL="${2}"

shift 2

TAGS="${*}"
TAGS="${TAGS:-latest}"

REGION="$(echo "${REPOSITORY_URL}" | cut -d. -f4)"

(cd "${SOURCE_PATH}" && $cmd build -t "${REPOSITORY_URL}" .)

aws ecr get-login-password --region "${REGION}" | $cmd login --username AWS --password-stdin "${REPOSITORY_URL}"

for t in ${TAGS}; do
  $cmd tag "${REPOSITORY_URL}" "${REPOSITORY_URL}:${t}"
  $cmd push "${REPOSITORY_URL}:${t}"
done
