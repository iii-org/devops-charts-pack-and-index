{{- define "iiidevops.annotations" -}}
iiidevops.org/project_name: {{ .Values.git.repoName }}
iiidevops.org/branch: {{ include "numericSafe" .Values.git.branch | quote }}
iiidevops.org/commit_id: {{ include "numericSafe" .Values.git.commitID | quote }}
iiidevops.org/type: test-webinspect
{{- end }}

{{- define "numericSafe" -}}
{{- if . | toString | contains "e+" -}}
{{ . | toString | replace "." "" | regexFind "^\\d+" }}
{{- else -}}
{{ . | toString }}
{{- end -}}
{{- end -}}
