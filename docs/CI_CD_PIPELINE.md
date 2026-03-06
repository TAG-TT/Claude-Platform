# CI/CD Pipeline Guide

Continuous Integration ensures code quality.

---

## CI Goals

Run tests automatically
build containers
detect security issues

---

## GitHub Actions

Location:

.github/workflows/

Example pipeline:

build.yml

---

## Typical Pipeline Steps

1 checkout code
2 install dependencies
3 run tests
4 build docker image
5 deploy

---

## Deployment

Deployment should run after:

successful test pipeline

---

## Security Checks

- Recommended tools:

Trivy
Dependabot
Snyk
