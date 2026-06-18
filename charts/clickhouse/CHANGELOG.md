# Changelog

## [0.2.0]

### Added

- ClickHouse Keeper support (Raft-based coordination, ZooKeeper replacement) as a dedicated, opt-in StatefulSet (`keeper.enabled`)
- Keeper quorum templates: StatefulSet (per-pod `server_id` derived from the pod ordinal), Raft config ConfigMap, headless service (stable per-member DNS), client service (`9181`), optional PodDisruptionBudget
- ClickHouse wired to Keeper when enabled: `<zookeeper>`, single-shard `<remote_servers>` cluster across the replicas, per-pod `<macros>` (`{shard}`/`{replica}`), and `<interserver_http_credentials>` so `ReplicatedMergeTree` / `ON CLUSTER` work out of the box
- `app.kubernetes.io/component` (`server` / `keeper`) labels to isolate ClickHouse and Keeper pods/services
- `clusterDomain` and `cluster.name` values
- `config.extraConfig` and `config.extraUsersConfig` are now rendered with `tpl`, so Helm template expressions (e.g. `{{ .Release.Namespace }}`) can be used — useful for per-release S3 prefixes

## [0.1.0]

### Added

- Initial release of the standalone ClickHouse Helm chart
- StatefulSet deployment using official `clickhouse/clickhouse-server` image
- Configurable `config.xml` and `users.xml` via ConfigMaps
- Persistent storage via PVC with configurable size and storage class
- HTTP (8123) and TCP/native (9000) service ports
- Headless service for StatefulSet DNS
- Optional Prometheus metrics sidecar with ServiceMonitor support
- Optional Ingress and Gateway API HTTPRoute resources
- Optional ServiceAccount creation
- Liveness, readiness, and startup probes via ClickHouse `/ping` endpoint
- Support for init SQL scripts via ConfigMap
- `extraObjects`, `extraEnvVars`, `extraVolumes`, `extraVolumeMounts` escape hatches
- Auto-generated credentials secret with connection URI
- Pod and container security context defaults
- `persistentVolumeClaimRetentionPolicy` support
