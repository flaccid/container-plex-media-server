# Plex Media Server Helm Chart

## Chart Values

| Parameter                  | Description                         | Default                                                 |
|----------------------------|-------------------------------------|---------------------------------------------------------|
| `affinity` | Pod affinity configuration | `{}` |
| `image.repository` | Image repository | `flaccid/plex-media-server` |
| `image.tag`        | Image tag. [Possible values](https://hub.docker.com/r/flaccid/plex-media-server/tags) | `latest` |
| `image.pullPolicy` | Image pull policy | `Always` |
| `ingress.annotations` | Ingress annotations | `{}` |
| `ingress.enabled`     | Enables Ingress | `false` |
| `ingress.hosts`       | Ingress host configurations | `[{host: plex-media-server.local, paths: [/]}]` |
| `ingress.tls`         | Ingress TLS configuration | `[]` |
| `nodeSelector` | Node labels for pod assignment | `{}` |
| `podAnnotations` | Key-value pairs to add as pod annotations | `{}` |
| `resources` | CPU/Memory resource requests/limits | `{}` |
| `service.annotations`    | Service annotations for the service | `{}` |
| `service.labels`         | Custom labels for the service | `{}` |
| `service.loadBalancerIP` | Load balancer IP for the Plex UI/API; set `service.type` to `LoadBalancer` to use this. | `""` |
| `service.port`           | Kubernetes port where the PMS UI/API is exposed | `32400` |
| `service.type`           | Kubernetes service type for the PMS UI/API | `ClusterIP` |
| `timezone` | Timezone PMS should run as, e.g. 'Australia/Sydney' | `Utc/UTC` |
| `tolerations` | Pod tolerations  | `[]` |

Read through the [values.yaml](values.yaml) file. It has several commented out suggested hints and values.
