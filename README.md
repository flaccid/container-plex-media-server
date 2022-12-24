# container-plex-media-server

Docker and Kubernetes support for running Plex Media Server.

## Overview

One of the main goals of this project is to standardise something that is not entirely open but also not packaged well.

The official docker image is full of bad practices and hacks. Here, we'd like to try set the debian package as the start-point and not deviate from LFS standards.

## Plex Notes

### Network

For information and troubleshooting on networking, see:
- https://support.plex.tv/articles/200430283-network
- https://support.plex.tv/articles/206225077-how-to-use-secure-server-connections/
- https://support.plex.tv/articles/200289506-remote-access/
- https://support.plex.tv/articles/200931138-troubleshooting-remote-access/
- https://support.plex.tv/articles/204604227-why-can-t-the-plex-app-find-or-connect-to-my-plex-media-server/

***Important***: With plex.tv service discovery, it may be necessary to add a custom server access URL.

#### Ports

See https://support.plex.tv/hc/en-us/articles/201543147-What-network-ports-do-I-need-to-allow-through-my-firewall-.

In the Docker image we `EXPOSE` all ports, but its up to the operator to expose
those ports on the LAN and WAN (e.g. on router and Kubernetes), depending on needs.

Note: for WAN, only ever expose or port-forward `tcp/32400`.

## Usage

### Kubernetes

This is the recommended way to deploy and manage the Plex workload.

#### Important

Once you have deployed:

- browse to the LAN IP you have exposed the main service, e.g. http://10.9.11.5:32400/web
- visit `Settings->(select server)->Network` and add your pod network subnet to the `List of IP addresses and networks that are allowed without auth` (near the bottom). For example, `10.42.0.0/16`.

### Helm

See the chart [README.md](charts/plex-media-server/README.md) for values.

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
helm upgrade plex-media-server charts/plex-media-server \
  -f helm-values.local.yaml
```

Testing after deployment:

`helm test plex-media-server`

Completely remove the chart:

`helm uninstall plex-media-server`

## License & Authors

- Author:: Chris Fordham ([chris@fordham.id.au](mailto:chris@fordham.id.au))

```text
Copyright:: 2017-2020, Chris Fordham

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
