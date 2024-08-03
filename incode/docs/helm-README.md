# Incode test

Incode take home test assigment: K8S resources

## Table of Contents

- [Usage](#usage)
- [CI/CD](#CI/CD)

## Usage

- All changes to the chart should be done via git.

- Navigate to ``incode/helm/testapp`` folder

- Make changes to the files, for example to `values.yaml`

- Commit the changes to git and push.

## CI/CD

- CI/CD is implemented with github actions (GHA)
- Make changes in the code, commit and push to the remote (main branch)
- After commit/merge to main branch, GHA updates the helm release on EKS with the new version of the chart.