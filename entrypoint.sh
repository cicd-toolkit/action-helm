#!/bin/bash
set -e

kubectl_version="$1"
helm_version="$2"
helm_docs_version="$3"
yq_version="$4"
ct_version="$5"

echo "using kubectl@$kubectl_version"
wget -q "https://dl.k8s.io/release/v$kubectl_version/bin/linux/amd64/kubectl" -O /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl


echo "using helm@$helm_version"
wget -q https://get.helm.sh/helm-${helm_version}-linux-amd64.tar.gz \
    && tar xzfv helm-v3*.tar.gz --directory /usr/local/bin/ linux-amd64/helm \
    && rm helm-v3*.tar.gz

echo "using helm-docs@$helm_docs_version"
wget -q https://github.com/norwoodj/helm-docs/releases/download/v${helm_docs_version}/helm-docs_${helm_docs_version}_Linux_x86_64.tar.gz \
    && tar xzf helm-docs_*.tar.gz --directory /usr/local/bin/ helm-docs  \
    && rm helm-docs_*.tar.gz

echo "using yq@$yq_version"
wget -q https://github.com/mikefarah/yq/releases/download/v$yq_version/yq_linux_amd64 -O /usr/bin/yq \
    && chmod +x /usr/bin/yq

echo "using ct@$ct_version"
wget -q https://github.com/helm/chart-testing/releases/download/v${ct_version}/chart-testing_${ct_version}_linux_amd64.tar.gz \
tar xzfv chart-testing*.tar.gz --directory /usr/local/bin/ ct \
ls -la  /usr/local/bin/
