{{- define "iiidevops.labels" -}}
- iiidevops.org/project_name: {{ .Values.git.repoName }}
- iiidevops.org/branch: {{ .Values.git.branch | quote }}
{{- end -}}
