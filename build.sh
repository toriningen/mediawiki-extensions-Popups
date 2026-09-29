#!/bin/bash

set -oxue pipefail

export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1

docker build -t mw-ext-popups .
docker run --rm -it -v $(pwd)/dist:/dist mw-ext-popups
