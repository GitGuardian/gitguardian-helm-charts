# Changelog

## 0.4.2 (2025-10-10)

* [mongo] Update charts/mongodb/values.yaml mongo ([#319](https://github.com/CloudPirates-io/helm-charts/pull/319))

## <small>0.4.1 (2025-10-09)</small>

* [all] add tests for openshift (#226) ([c80c98a](https://github.com/CloudPirates-io/helm-charts/commit/c80c98a)), closes [#226](https://github.com/CloudPirates-io/helm-charts/issues/226)
* fix: newline between mongo labels and additional labels (#301) ([ea7937f](https://github.com/CloudPirates-io/helm-charts/commit/ea7937f)), closes [#301](https://github.com/CloudPirates-io/helm-charts/issues/301)

## 0.4.0 (2025-10-09)

* feat: add metrics exporter (#243) ([c931978](https://github.com/CloudPirates-io/helm-charts/commit/c931978)), closes [#243](https://github.com/CloudPirates-io/helm-charts/issues/243)

## <small>0.3.3 (2025-10-09)</small>

* makes configmap name dynamic (#279) ([6dd10a9](https://github.com/CloudPirates-io/helm-charts/commit/6dd10a9)), closes [#279](https://github.com/CloudPirates-io/helm-charts/issues/279)

## <small>0.3.2 (2025-10-09)</small>

* [mongo] Update charts/mongodb/values.yaml mongo to v8.0.15 (patch) (#262) ([2fc1f1a](https://github.com/CloudPirates-io/helm-charts/commit/2fc1f1a)), closes [#262](https://github.com/CloudPirates-io/helm-charts/issues/262)

## <small>0.3.1 (2025-10-08)</small>

*  [minio, mongodb, postgres, timescaledb] Update securityContext to containerSecurityContext in the v ([8a4003f](https://github.com/CloudPirates-io/helm-charts/commit/8a4003f)), closes [#213](https://github.com/CloudPirates-io/helm-charts/issues/213)
* [mariadb] use tpl to return existingConfigMap (#217) ([c7c2f4c](https://github.com/CloudPirates-io/helm-charts/commit/c7c2f4c)), closes [#217](https://github.com/CloudPirates-io/helm-charts/issues/217)
* update values.schema.json (#242) ([f973e47](https://github.com/CloudPirates-io/helm-charts/commit/f973e47)), closes [#242](https://github.com/CloudPirates-io/helm-charts/issues/242)

## 0.3.0 (2025-10-02)

* make mongodb run on openshift (#202) ([b654629](https://github.com/CloudPirates-io/helm-charts/commit/b654629)), closes [#202](https://github.com/CloudPirates-io/helm-charts/issues/202)
* [redis] return fqdn for sentinel master lookup (#156) ([00b9882](https://github.com/CloudPirates-io/helm-charts/commit/00b9882)), closes [#156](https://github.com/CloudPirates-io/helm-charts/issues/156)

## 0.2.0 (2025-09-25)

* [documentation] update readme files ([16944cd](https://github.com/CloudPirates-io/helm-charts/commit/16944cd))
* [mongo] chore(deps): update docker.io/mongo:8.0.13 Docker digest to 7acbcf3 ([37cb0a1](https://github.com/CloudPirates-io/helm-charts/commit/37cb0a1))
* [mongo] chore(deps): update docker.io/mongo:8.0.13 Docker digest to cf340b1 ([3fe0172](https://github.com/CloudPirates-io/helm-charts/commit/3fe0172))
* add custom user creation at initialization (#153) ([772d18f](https://github.com/CloudPirates-io/helm-charts/commit/772d18f)), closes [#153](https://github.com/CloudPirates-io/helm-charts/issues/153)
* add imagepullsecret support ([2768b4e](https://github.com/CloudPirates-io/helm-charts/commit/2768b4e))
* fix test ([cfac15f](https://github.com/CloudPirates-io/helm-charts/commit/cfac15f))
* Realese appVersion 8.0.13 ([4710010](https://github.com/CloudPirates-io/helm-charts/commit/4710010))
* replace deployment with statefulset, fix config, securityContext ([9ac37ad](https://github.com/CloudPirates-io/helm-charts/commit/9ac37ad))
* update chart to 0.1.4 ([a6d86b7](https://github.com/CloudPirates-io/helm-charts/commit/a6d86b7))
* Add ArtifactHub Badges to all Charts ([08b855b](https://github.com/CloudPirates-io/helm-charts/commit/08b855b))
* Add ArtifactHub repo config ([15180a8](https://github.com/CloudPirates-io/helm-charts/commit/15180a8))
* Add cosign signature READMEs ([5f82e7f](https://github.com/CloudPirates-io/helm-charts/commit/5f82e7f))
* Add extensive chart testing ([a46efac](https://github.com/CloudPirates-io/helm-charts/commit/a46efac))
* add extraObject array to all charts ([34772b7](https://github.com/CloudPirates-io/helm-charts/commit/34772b7))
* Add generated values.schema.json files from values.yaml ([aa79ac3](https://github.com/CloudPirates-io/helm-charts/commit/aa79ac3))
* Add initial Changelogs to all Charts ([68f10ca](https://github.com/CloudPirates-io/helm-charts/commit/68f10ca))
* Add LICENSE ([fdbf1ab](https://github.com/CloudPirates-io/helm-charts/commit/fdbf1ab))
* add logos to helm-charts ([fc70cdc](https://github.com/CloudPirates-io/helm-charts/commit/fc70cdc))
* Bump chart version ([77f76af](https://github.com/CloudPirates-io/helm-charts/commit/77f76af))
* Bump chart version ([159ba82](https://github.com/CloudPirates-io/helm-charts/commit/159ba82))
* Bump chart version ([98d3ee6](https://github.com/CloudPirates-io/helm-charts/commit/98d3ee6))
* Fix image tag/digest handling ([a5c982b](https://github.com/CloudPirates-io/helm-charts/commit/a5c982b))
* Fix imagePullSecrets format and pull always ([ce0d301](https://github.com/CloudPirates-io/helm-charts/commit/ce0d301))
* fix readme.md install text, update chart.yaml home-website ([3511582](https://github.com/CloudPirates-io/helm-charts/commit/3511582))
* Fix values.yaml / Chart.yaml linting issues ([043c7e0](https://github.com/CloudPirates-io/helm-charts/commit/043c7e0))
* Format README files ([04aacab](https://github.com/CloudPirates-io/helm-charts/commit/04aacab))
* init, add mariadb, mongodb and redis chart ([8e44c83](https://github.com/CloudPirates-io/helm-charts/commit/8e44c83))
* Release new chart versions / update sources ([dbb0e45](https://github.com/CloudPirates-io/helm-charts/commit/dbb0e45))
* Remove leading $ from code blocks ([836b2e3](https://github.com/CloudPirates-io/helm-charts/commit/836b2e3))
* remove serviceaccounts from all charts ([be8f43a](https://github.com/CloudPirates-io/helm-charts/commit/be8f43a))
* Update CHANGELOG.md ([72601e5](https://github.com/CloudPirates-io/helm-charts/commit/72601e5))
* Update CHANGELOG.md ([5c9f4d0](https://github.com/CloudPirates-io/helm-charts/commit/5c9f4d0))
* Update CHANGELOG.md ([3174cb2](https://github.com/CloudPirates-io/helm-charts/commit/3174cb2))
* Update docker.io/mongo Docker tag to v8.0.13 ([2a585ff](https://github.com/CloudPirates-io/helm-charts/commit/2a585ff))
* Update docker.io/mongo:8.0.13 Docker digest to c750922 ([cbd41d9](https://github.com/CloudPirates-io/helm-charts/commit/cbd41d9))
* Update mongodb readme ([52b9620](https://github.com/CloudPirates-io/helm-charts/commit/52b9620))
* update readme, chart.yaml texts and descriptions ([0179046](https://github.com/CloudPirates-io/helm-charts/commit/0179046))
* Use lookup function for password where applicable ([dfb9a0e](https://github.com/CloudPirates-io/helm-charts/commit/dfb9a0e))
* fix: chart icon urls ([cc38c0d](https://github.com/CloudPirates-io/helm-charts/commit/cc38c0d))
