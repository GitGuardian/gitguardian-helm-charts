{{/*
Expand the name of the chart.
*/}}
{{- define "minio.name" -}}
{{- include "cloudpirates.name" . -}}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "minio.fullname" -}}
{{- include "cloudpirates.fullname" . -}}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "minio.chart" -}}
{{- include "cloudpirates.chart" . -}}
{{- end }}

{{/*
Common labels
*/}}
{{- define "minio.labels" -}}
{{- include "cloudpirates.labels" . -}}
{{- end }}

{{/*
Common annotations
*/}}
{{- define "minio.annotations" -}}
{{- with .Values.commonAnnotations }}
{{- toYaml . }}
{{- end }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "minio.selectorLabels" -}}
{{- include "cloudpirates.selectorLabels" . -}}
{{- end }}

{{/*
Return the proper MinIO image name
*/}}
{{- define "minio.image" -}}
{{- if .Values.image.useCpuV1 }}
{{- $registryName := .Values.image.registry -}}
{{- $repositoryName := .Values.image.repository -}}
{{- $tag := .Values.image.tagCpuV1 | toString -}}
{{- if .Values.global }}
    {{- if .Values.global.imageRegistry }}
        {{- $registryName = .Values.global.imageRegistry -}}
    {{- end -}}
{{- end -}}
{{- if $registryName }}
{{- printf "%s/%s:%s" $registryName $repositoryName $tag -}}
{{- else -}}
{{- printf "%s:%s" $repositoryName $tag -}}
{{- end -}}
{{- else }}
{{- include "cloudpirates.image" (dict "image" .Values.image "global" .Values.global) -}}
{{- end }}
{{- end }}

{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "minio.imagePullSecrets" -}}
{{ include "cloudpirates.images.renderPullSecrets" (dict "images" (list .Values.image) "context" .) }}
{{- end -}}

{{/*
Return MinIO credentials secret name
*/}}
{{- define "minio.secretName" -}}
{{- if .Values.auth.existingSecret -}}
    {{- include "cloudpirates.tplvalues.render" (dict "value" .Values.auth.existingSecret "context" .) -}}
{{- else -}}
    {{- include "minio.fullname" . -}}
{{- end -}}
{{- end }}

{{/*
Return MinIO root user
*/}}
{{- define "minio.rootUser" -}}
{{- if .Values.auth.existingSecret -}}
    {{- printf "%s" .Values.auth.existingSecretUserKey -}}
{{- else -}}
root-user
{{- end -}}
{{- end }}

{{/*
Return MinIO root password
*/}}
{{- define "minio.rootPasswordKey" -}}
{{- if .Values.auth.existingSecret -}}
    {{- printf "%s" .Values.auth.existingSecretPasswordKey -}}
{{- else -}}
root-password
{{- end -}}
{{- end }}

{{/*
Return MinIO server URL args
*/}}
{{- define "minio.serverUrl" -}}
{{- if .Values.config.serverUrl -}}
{{- printf "--console-address :%d --address :%d" (int .Values.service.consolePort) (int .Values.service.port) -}}
{{- else -}}
{{- printf "--console-address :%d --address :%d" (int .Values.service.consolePort) (int .Values.service.port) -}}
{{- end -}}
{{- end }}

{{/*
Returns MinIO serviceAccount name
*/}}
{{- define "minio.serviceAccountName" -}}
    {{- if .Values.serviceAccount.create -}}
        {{ default (include "minio.fullname" .) .Values.serviceAccount.name }}
    {{- else -}}
        {{ default "default" .Values.serviceAccount.name }}
    {{- end -}}
{{- end -}}

{{/*
Merge global.podLabels with a component-level podLabels map.
Component-level values win over global values on conflict.
Usage: {{ include "minio.podLabels" (dict "local" .Values.podLabels "context" $) }}
*/}}
{{- define "minio.podLabels" -}}
{{- $global := (.context.Values.global).podLabels | default dict -}}
{{- $local := .local | default dict -}}
{{- $merged := merge (deepCopy $local) $global -}}
{{- if $merged -}}
{{- toYaml $merged }}
{{- end -}}
{{- end -}}

{{/*
Merge global.podAnnotations with a component-level podAnnotations map.
Component-level values win over global values on conflict.
Usage: {{ include "minio.podAnnotations" (dict "local" .Values.podAnnotations "context" $) }}
*/}}
{{- define "minio.podAnnotations" -}}
{{- $global := (.context.Values.global).podAnnotations | default dict -}}
{{- $local := .local | default dict -}}
{{- $merged := merge (deepCopy $local) $global -}}
{{- if $merged -}}
{{- toYaml $merged }}
{{- end -}}
{{- end -}}

{{/*
Return nodeSelector: component-level value if set, otherwise global.nodeSelector.
Usage: {{ include "minio.nodeSelector" (dict "local" .Values.nodeSelector "context" $) }}
*/}}
{{- define "minio.nodeSelector" -}}
{{- $global := (.context.Values.global).nodeSelector | default dict -}}
{{- $local := .local | default dict -}}
{{- if $local -}}
{{- toYaml $local }}
{{- else if $global -}}
{{- toYaml $global }}
{{- end -}}
{{- end -}}

{{/*
Concat component-level tolerations with global.tolerations.
Usage: {{ include "minio.tolerations" (dict "local" .Values.tolerations "context" $) }}
*/}}
{{- define "minio.tolerations" -}}
{{- $global := (.context.Values.global).tolerations | default list -}}
{{- $local := .local | default list -}}
{{- $merged := concat $local $global -}}
{{- if $merged -}}
{{- toYaml $merged }}
{{- end -}}
{{- end -}}

{{/*
Concat component-level extraVolumes with global.extraVolumes.
Usage: {{ include "minio.extraVolumes" (dict "local" .Values.extraVolumes "context" $) }}
*/}}
{{- define "minio.extraVolumes" -}}
{{- $global := (.context.Values.global).extraVolumes | default list -}}
{{- $local := .local | default list -}}
{{- $merged := concat $local $global -}}
{{- if $merged -}}
{{- toYaml $merged }}
{{- end -}}
{{- end -}}

{{/*
Concat component-level extraVolumeMounts with global.extraVolumeMounts.
Usage: {{ include "minio.extraVolumeMounts" (dict "local" .Values.extraVolumeMounts "context" $) }}
*/}}
{{- define "minio.extraVolumeMounts" -}}
{{- $global := (.context.Values.global).extraVolumeMounts | default list -}}
{{- $local := .local | default list -}}
{{- $merged := concat $local $global -}}
{{- if $merged -}}
{{- toYaml $merged }}
{{- end -}}
{{- end -}}

{{/*
Concat component-level env vars with global.envVars.
Usage: {{ include "minio.envVars" (dict "local" .Values.config.extraEnvVars "context" $) }}
*/}}
{{- define "minio.envVars" -}}
{{- $global := (.context.Values.global).envVars | default list -}}
{{- $local := .local | default list -}}
{{- $merged := concat $local $global -}}
{{- if $merged -}}
{{- toYaml $merged }}
{{- end -}}
{{- end -}}

{{/*
Return global.envFrom list (no component-level equivalent in this chart).
Usage: {{ include "minio.envFrom" $ }}
*/}}
{{- define "minio.envFrom" -}}
{{- $global := (.Values.global).envFrom | default list -}}
{{- if $global -}}
{{- toYaml $global }}
{{- end -}}
{{- end -}}

{{/*
Return imagePullPolicy: image.imagePullPolicy if set, otherwise global.image.imagePullPolicy.
Fallback order matches cloudpirates.imagePullPolicy ("Always") for consistency with
the rest of the library chart.
Usage: {{ include "minio.imagePullPolicy" $ }}
*/}}
{{- define "minio.imagePullPolicy" -}}
{{- $global := ((.Values.global).image).imagePullPolicy -}}
{{- $local := .Values.image.imagePullPolicy -}}
{{- $local | default $global | default "Always" -}}
{{- end -}}