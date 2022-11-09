{{- define "deployment" }}
{{- if .object.enabled }}
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ .object.name }}
spec:
  replicas: 3
  selector:
    matchLabels:
      name: httpd
  template:
    metadata:
      labels:
        name: httpd
    spec:
      containers:
        - name: {{ required (include "requiredErrMsg" .) .object.name }}-container
          image: {{ required (include "requiredErrMsg" .) .object.image }}
          workingDir: {{ .workdir }}
{{- end }}
{{- end }}