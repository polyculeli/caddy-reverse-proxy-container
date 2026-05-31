set dotenv-load

login:
    podman login docker.io -u $DOCKERHUB_USERNAME -p $DOCKERHUB_TOKEN

logout:
    podman logout docker.io

pull:
    podman pull docker.io/$DOCKERHUB_USERNAME/$IMAGE_NAME

build:
    podman build -f caddy.dockerfile -t docker.io/$DOCKERHUB_USERNAME/$IMAGE_NAME --platform linux/amd64,linux/arm64 .
    # podman build -f caddy.dockerfile -t docker.io/$DOCKERHUB_USERNAME/$IMAGE_NAME --platform linux/arm64 .

push:
    # podman buildx build --tag docker.io/$DOCKERHUB_USERNAME/$IMAGE_NAME --platform linux/amd64,linux/arm/v7,linux/arm64 -f caddy.dockerfile .
    podman push --all docker.io/$DOCKERHUB_USERNAME/$IMAGE_NAME

rate-limit:
    # Check rate limit status with authentication
    TOKEN=$(curl -s -u "$DOCKERHUB_USERNAME:$DOCKERHUB_TOKEN" \
      "https://auth.docker.io/token?service=registry.docker.io&scope=repository:ratelimitpreview/test:pull" | \
      jq -r .token); \
    curl -s -H "Authorization: Bearer $TOKEN" \
      -I https://registry-1.docker.io/v2/ratelimitpreview/test/manifests/latest 2>&1 | \
      grep -i ratelimit
