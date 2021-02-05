{{- define "web.name" -}}
  {{- .Release.Name | trunc 59 -}}
{{- end -}}

{{- define "iiidevops.labels" -}}
iiidevops.org/project_name: {{ .Values.git.repoName }}
iiidevops.org/branch: {{ include "numericSafe" .Values.git.branch }}
{{- end }}

{{- define "web.postInstallDebug" -}}
{{- if .Values.web.debug | eq true -}}
before-hook-creation
{{- else -}}
before-hook-creation,hook-succeeded
{{- end -}}
{{- end -}}

{{- define "numericSafe" -}}
{{- if . | toString | contains "e+" -}}
{{ . | toString | replace "." "" | regexFind "^\\d+" }}
{{- else -}}
{{ . }}
{{- end -}}
{{- end -}}
