# GitHub Actions Kubernetes Toolkit
This action provides kubectl, helm, helm-docs, ct, jq ,yq for GitHub Actions.

As with the upstream inspiration for this project, please :star: it if you do end up using it!

## Usage

`.github/workflows/push.yml`

```yaml
on: push
name: deploy
jobs:
  deploy:
    name: deploy to cluster
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: deploy to cluster
      uses: cicd-toolkit/action-helm@v1.0.0
      with: # defaults to latest kubectl & helm binary versions
        kubectl_version: v1.21.5
        helm_version: v3.7.0
    # After it's been configured, you can now freely use kubectl & helm commands the rest of the job.
    # This could also be used for multi-cluster deployment, as long as your provided kube config has all required clusters.
    - name: Check kubectl version
      run: kubectl version
    - name: Check helm version
      run: helm version

```

## Arguments

```
  kubectl_version:
    description: 'kubectl version, e.g. `v1.21.0`'
    required: false
    default: "1.27.0"
  helm_version:
    description: 'helm cli version, e.g. `v3.7.0`'
    required: false
    default: "3.11.3"
  helm_docs_version:
    description: 'helm-docs version'
    required: false
    default: '1.11.0'
  yq_version:
    description: 'yq version'
    required: false
    default: '4.33.3'
  ct_version:
    description: 'ct version'
    required: false
    default: '3.8.0'
```
