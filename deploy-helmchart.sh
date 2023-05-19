helm lint charts/haraka/ && \
helm package -d helm-repo charts/haraka/ \
helm repo index helm-repo --url https://haraka-helm.kubero.dev