# docker-plex-media-server

Docker and Kubernetes support for running Plex Media Server.

## Overview

One of the main goals of this project is to standardize something that is not entirely open but also not packaged well.

The official docker image is full of bad practices and hacks. Here, we'd like to try set the debian package as the start-point and not deviate from LFS standards.

## Usage

### Kubernetes & Helm

Validate the chart:

`helm lint charts/plex-media-server`

Dry run and print out rendered YAML:

`helm install --dry-run --debug plex-media-server charts/plex-media-server`

Dry run and print out rendered YAML with merged values file:

```
helm install \
  --dry-run \
  --debug \
  -f helm-values.local.yaml \
    plex-media-server charts/plex-media-server
```

Install the chart:

`helm install plex-media-server charts/plex-media-server`

Or, with some different values:

```
helm install plex-media-server \
  --set image.tag="arm64" \
  --set service.type="LoadBalancer" \
    charts/plex-media-server
```

Or, the same but with a custom values from a file:

```
helm install plex-media-server \
  -f helm-values.local.yaml \
    charts/plex-media-server
```

Upgrade the chart, with values file:

```
helm upgrade \
  -f helm-values.local.yaml
    plex-media-server charts/plex-media-server
```

Testing after deployment:

`helm test plex-media-server`

Completely remove the chart:

`helm uninstall plex-media-server`
