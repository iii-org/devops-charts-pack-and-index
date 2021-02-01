{{- define "devops.labels" -}}
project_name: {{ .Values.git.repoName }}
branch: {{ .Values.git.branch | quote }}
{{- end -}}
