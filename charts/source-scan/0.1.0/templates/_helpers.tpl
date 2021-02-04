{{- define "iiidevops.labels" -}}
iiidevops.org/project_name: {{ .Values.git.repoName }}
iiidevops.org/branch: {{ .Values.git.branch | quote }}
{{- end -}}

{{- define "git.safeCommitID" -}}
{{- if .Values.git.commitID | toString | contains "e+" -}}
{{ .Values.git.commitID | toString | replace "." "" | regexFind "^\\d+" }}
{{- else -}}
{{ .Values.git.commitID }}
{{- end -}}
{{- end -}}
