{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "web.name" -}}
  {{- .Release.Name | trunc 59 -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "web.chart" -}}
  {{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Workload labels
*/}}
{{- define "web.labels" -}}
app: {{ include "web.name" . }}
project_name: {{ .Values.git.repoName }}
branch: {{ .Values.git.branch | quote }}
helm.sh/chart: {{ include "web.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
{{- end -}}

{{- define "web.port" -}}
{{- with .Values.web.type -}}
  {{- if list "php" "uwsgi-flask" "apache" | has . -}}
    80
  {{- else if "flask" | eq . -}}
    5000
  {{- else if "spring" | eq . -}}
    8080
  {{- else -}}
    {{ $.Values.web.port }}
  {{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "web.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
{{ default (include "web.name" .) .Values.serviceAccount.name }}
{{- else -}}
{{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}
