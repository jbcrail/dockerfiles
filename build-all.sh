#!/bin/bash

set -e
set -o pipefail

docker build --rm --force-rm -t "jbcrail/accumulo-proxy:1.5.2" accumulo-proxy
docker push --disable-content-trust=false "jbcrail/accumulo-proxy:1.5.2"
docker tag "jbcrail/accumulo-proxy:1.5.2" "jbcrail/accumulo-proxy:latest"
