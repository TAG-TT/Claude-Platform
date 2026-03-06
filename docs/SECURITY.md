# Security Policy

Security is critical for this repository.

---

## Secret Management

Never commit:

.env
credentials
keys

Use:

environment variables

---

## Dependency Security

Regularly scan dependencies using:

npm audit
pip audit
cargo audit

---

## Infrastructure Security

Terraform infrastructure must be reviewed before deployment.

---

## AI Agent Restrictions

Agents must not:

access secrets
modify infrastructure automatically

---

## Reporting Vulnerabilities

If a vulnerability is discovered:

1 report issue
2 mark as security
3 avoid public disclosure
