{{- define "iiidevops.labels" -}}
iiidevops.org/project_name: {{ .Values.git.repoName }}
iiidevops.org/branch: {{ include "numericSafe" .Values.git.branch }}
{{- end -}}

{{- define "numericSafe" -}}
{{- if . | toString | contains "e+" -}}
{{ . | toString | replace "." "" | regexFind "^\\d+" }}
{{- else -}}
{{ . | toString }}
{{- end -}}
{{- end -}}

{{- define "allTurnedOff" -}}
"{{ and (.Values.checkmarx.enabled | not) (.Values.sonarqube.enabled | not) }}"
{{- end -}}
