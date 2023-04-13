# Base image
FROM python:3.11-alpine

# installes required packages for our script
RUN	apk add --no-cache \
  bash \
  ca-certificates \
  curl \
  wget \
  jq 
  
  
RUN wget -q https://github.com/mikefarah/yq/releases/download/v4.33.3/yq_linux_amd64 -O /usr/bin/yq \ 
    && chmod +x /usr/bin/yq  
    
RUN wget -q "https://dl.k8s.io/release/v1.27.0/bin/linux/amd64/kubectl" -O /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl  
    
RUN cd /tmp \
    && wget -q https://github.com/norwoodj/helm-docs/releases/download/v1.11.0/helm-docs_1.11.0_Linux_x86_64.tar.gz \
    && tar xzfv helm-docs_*.tar.gz --directory /usr/local/bin/ helm-docs  \
    && rm helm-docs_*.tar.gz
    
RUN cd /tmp \
    && wget -q https://get.helm.sh/helm-v3.11.3-linux-amd64.tar.gz \
    && tar xzfv helm-v3*.tar.gz --directory /usr/local/bin/ linux-amd64/helm \
    && rm helm-v3*.tar.gz  
    
RUN cd /tmp \
    && wget -q https://github.com/helm/chart-testing/releases/download/v3.8.0/chart-testing_3.8.0_linux_amd64.tar.gz \
    && tar xzfv chart-testing*.tar.gz --directory /usr/local/bin/ ct \
    && rm chart-testing-*.tar.gz      



# Copies your code file  repository to the filesystem
COPY entrypoint.sh /entrypoint.sh

# change permission to execute the script and
RUN chmod +x /entrypoint.sh

# file to execute when the docker container starts up
ENTRYPOINT ["/entrypoint.sh"]
