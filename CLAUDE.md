# GitGuardian Helm Charts - AI Assistant Guide

## Project Overview

Fork of [CloudPirates-io/helm-charts](https://github.com/CloudPirates-io/helm-charts) maintained by GitGuardian.
Contains 19 application Helm charts + 1 library chart (`common`). Daily automated sync with upstream.

## Architecture

### Chart Structure

Each chart follows this layout:
```
charts/{name}/
  Chart.yaml           # Metadata + dependencies
  Chart.lock           # Dependency lock (common library)
  values.yaml          # Default config
  values.schema.json   # Auto-generated from values.yaml - DO NOT edit manually
  templates/           # Kubernetes manifests
    _helpers.tpl       # Uses cloudpirates.* prefix (from common v2.x)
  tests/               # helm-unittest YAML tests
    common-parameters_test.yaml
    *_test.yaml
  charts/              # Vendored dependencies (.tgz)
```

### Common Library Chart

All application charts depend on `charts/common` (library type), which provides shared templates with the `cloudpirates.*` prefix (e.g., `cloudpirates.fullname`, `cloudpirates.labels`).

**Critical**: The common chart v2.x uses `cloudpirates.*` prefix. v1.x used `common.*` prefix. If unit tests fail with `no template "cloudpirates.fullname"`, the dependency tgz is missing or outdated. Fix with:
```bash
helm dependency build charts/{name}/
```

### Fork vs Upstream Differences

- **GitGuardian workflows** end with `-gitguardian.yaml` (e.g., `release-gitguardian.yaml`, `pull-request-gitguardian.yaml`)
- **Upstream workflows** are kept as-is for sync compatibility but may lack required secrets
- GitGuardian pushes to GHCR only (`ghcr.io/gitguardian/gitguardian-helm-charts`), not CloudPirates registries
- No cosign signing in GitGuardian release workflow
- `.gitattributes` uses `merge=theirs` for `**/CHANGELOG.md` to auto-resolve changelog conflicts during upstream sync

## Key Commands

### Testing
```bash
# Unit tests for a specific chart
helm unittest charts/{name}/

# Lint a chart
helm lint charts/{name}/

# Full lint with chart-testing (as CI does)
ct lint --target-branch main --validate-maintainers=false --additional-commands "helm unittest {{ .Path }}"

# Run all tests locally with kind cluster
./test-charts.sh
```

### Dependencies
```bash
# Download/update dependencies for a chart (REQUIRED before unit tests)
helm dependency build charts/{name}/

# Update all chart dependencies
./update-charts.sh
```

### Schema Generation
```bash
# Schemas are auto-generated - regenerate with:
helm schema -input charts/{name}/values.yaml -output charts/{name}/values.schema.json
```

### Upstream Sync
```bash
# Manual sync setup
git remote add upstream https://github.com/CloudPirates-io/helm-charts.git
git fetch upstream main
git merge upstream/main --no-edit -X theirs
```

## Common Pitfalls

### Unit Tests Fail with "no template cloudpirates.fullname"
The `charts/{name}/charts/` directory is missing the `common-*.tgz`. Run `helm dependency build charts/{name}/`.

### values.schema.json Conflicts During Merge
These files are auto-generated. Accept upstream's version (`-X theirs`) or regenerate after merge.

### YAML Duplicate Key Errors in CI
`ct lint` uses yamllint with `key-duplicates` rule (stricter than `helm lint`). Check for duplicate top-level keys in `values.yaml`.

### Unit Tests Fail with Wrong Image Values
When upstream changes default `image.registry` or `image.repository` in `values.yaml`, the test assertions in `tests/common-parameters_test.yaml` must be updated to match.

### CI Can't Push Workflow Files
`GITHUB_TOKEN` cannot modify `.github/workflows/` files. Use a PAT with `workflow` scope for operations that touch workflow files.

## CI/CD Workflows

| Workflow | Purpose | Trigger |
|----------|---------|---------|
| `release-gitguardian.yaml` | Release charts to GHCR | Push to main (charts/**) or manual |
| `pull-request-gitguardian.yaml` | PR validation for GitGuardian | PR events |
| `generate-schema-gitguardian.yaml` | Regenerate values.schema.json | PR with values.yaml changes |
| `sync-upstream.yaml` | Daily sync with CloudPirates upstream | Cron 02:00 UTC or manual |
| `pull-request.yaml` | Upstream PR validation (kept for sync) | PR events |
| `release.yaml` | Upstream release (kept for sync) | Push to main |
| `changelog-and-release.yaml` | Upstream changelog + release | Push to main |
| `auto-label.yaml` | Auto-label PRs from title | Issue/PR opened |
| `stale.yaml` | Close stale issues/PRs | Daily cron |

## Code Style

- **Indentation**: 2 spaces (YAML/Helm), 4 spaces (JSON schemas)
- **Line endings**: LF
- **Charset**: UTF-8
- **Commits**: Must be signed
- **Tag format**: `{chart-name}-{version}` (e.g., `postgres-0.15.5`)

## Available Charts

clusterpirate, common (library), etcd, ghost, keycloak, mariadb, memcached, minio, mongodb, nginx, postgres, rabbitmq, rabbitmq-cluster-operator, redis, rustfs, timescaledb, valkey, zookeeper
