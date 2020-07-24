# docker-plex-media-server

Docker and Kubernetes support for running Plex Media Server.

## Usage

### Kubernetes & Helm

Validate the chart:

`helm lint charts/plex-media-server`

Dry run and print out rendered YAML:

`helm install --dry-run --debug plex-media-server charts/plex-media-server`

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

Upgrade the chart:

`helm upgrade plex-media-server charts/plex-media-server`

Testing after deployment:

`helm test plex-media-server`

Completely remove the chart:

`helm uninstall plex-media-server`
