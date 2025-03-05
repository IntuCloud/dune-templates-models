#!/bin/bash
set -e
apt update && sudo apt upgrade -y
apt-get install -y ca-certificates curl
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
docker run -d \
  --name photoprism \
  --security-opt seccomp=unconfined \
  --security-opt apparmor=unconfined \
  -p 2342:2342 \
  -e PHOTOPRISM_UPLOAD_NSFW="true" \
  -e PHOTOPRISM_ADMIN_PASSWORD="insecure" \
  -v /photoprism/storage:/photoprism/storage \
  -v ~/Pictures:/photoprism/originals \
  photoprism/photoprism:latest
