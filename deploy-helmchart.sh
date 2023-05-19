helm lint charts/haraka/ && \
helm package -d docs charts/haraka/ && \
helm repo index docs --url https://haraka.kubero.dev