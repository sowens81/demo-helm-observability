{{/*
Generate a consistent name for resources based on the release name and chart name.
*/}}
{{- define "nginx-service.name" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Generate the name for the ConfigMap resource.
*/}}
{{- define "nginx-service.configmapName" -}}
{{- printf "%s-config" (include "nginx-service.name" .) -}}
{{- end -}}


{{/*
Generate the name for the HorizontalPodAutoscaler.
*/}}
{{- define "nginx-service.hpaName" -}}
{{- printf "%s-hpa" (include "nginx-service.name" .) -}}
{{- end -}}

{{/*
Generate the name for the Service.
*/}}
{{- define "nginx-service.serviceName" -}}
{{- printf "%s-service" (include "nginx-service.name" .) -}}
{{- end -}}

{{/*
Generate the name for the Deployment.
*/}}
{{- define "nginx-service.deploymentName" -}}
{{- include "nginx-service.name" . -}}
{{- end -}}
