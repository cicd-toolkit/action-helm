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

ENV KUBECTL_VERSION "1.27.0"
RUN wget -q https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl


ENV HELM_VERSION "3.11.3"
RUN cd /tmp \
    && wget -q https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz \
    && tar xzfv helm-v${HELM_VERSION}*.tar.gz --directory /usr/local/bin/ linux-amd64/helm \
    && rm helm-v${HELM_VERSION}-*.tar.gz


ENV HELM_DOCS_VERSION "1.11.0"
RUN cd /tmp \
    && wget -q https://github.com/norwoodj/helm-docs/releases/download/v${HELM_DOCS_VERSION}/helm-docs_${HELM_DOCS_VERSION}_Linux_x86_64.tar.gz \
    && tar xzfv helm-docs_*.tar.gz --directory /usr/local/bin/ helm-docs  \
    && rm helm-docs_*.tar.gz


ENV YQ_VERSION "4.33.3"
RUN wget -q https://github.com/mikefarah/yq/releases/download/v${YQ_VERSION}/yq_linux_amd64 -O /usr/bin/yq \
    && chmod +x /usr/bin/yq


ENV CR_VERSION "3.8.0"
RUN cd /tmp \
    && wget -q https://github.com/helm/chart-testing/releases/download/v${CR_VERSION}/chart-testing_${CR_VERSION}_linux_amd64.tar.gz \
    && tar xzfv chart-testing_${CR_VERSION}*.tar.gz --directory /usr/local/bin/ ct


COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
