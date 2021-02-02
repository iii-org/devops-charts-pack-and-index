{{- define "web.name" -}}
  {{- .Release.Name | trunc 59 -}}
{{- end -}}

{{- define "iiidevops.labels" -}}
iiidevops.org/project_name: {{ .Values.git.repoName }}
iiidevops.org/branch: {{ .Values.git.branch | quote }}
{{- end }}

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

{{- define "web.postInstallDebug" -}}
{{- if eq {{ .Values.web.debug }} "true" -}}
before-hook-creation,hook-succeeded
{{- else -}}
before-hook-creation
{{- end -}}
{{- end -}}