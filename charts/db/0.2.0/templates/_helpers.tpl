{{/*
Expand the name of the chart.
*/}}
{{- define "db.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

## iiiorg chart label for iiiorg-api
## used for iii-org-api to lock resource
## warning: should label on namespace
{{- define "iiidevops.labels" -}}
iiidevops.org/project_name: {{ .Values.git.repoName }}
iiidevops.org/branch: {{ include "numericSafe" .Values.git.branch }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "db.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "db.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "numericSafe" -}}
{{- if . | toString | contains "e+" -}}
{{ . | toString | replace "." "" | regexFind "^\\d+" }}
{{- else -}}
{{ . }}
{{- end -}}
{{- end -}}

