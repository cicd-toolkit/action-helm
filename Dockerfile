# Base image
FROM python:3.11-alpine

LABEL version="1.0.2"
LABEL name="action-helm"
LABEL repository="https://github.com/cicd-toolkit/action-helm"
LABEL homepage="https://github.com/cicd-toolkit/action-helm"

LABEL com.github.actions.name="Kubernetes Toolkit"
LABEL com.github.actions.description="Configures a kubernetes toolkit. Includes kubectl, helm, helm-docs, ct, jq, yq"
LABEL com.github.actions.icon="terminal"
LABEL com.github.actions.color="blue"

# installes required packages for our script
RUN	apk add --no-cache \
  bash \
  ca-certificates \
  curl \
  wget \
  jq

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
