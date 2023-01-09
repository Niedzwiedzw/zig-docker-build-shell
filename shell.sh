#!/usr/bin/env bash

set -e
echo "attaching to zig building shell"
docker-compose build
docker-compose run --rm zig bash -c "/build.sh && bash"
