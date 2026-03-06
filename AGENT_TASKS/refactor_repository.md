# Refactor Repository

🟩 AGENT TASK FILE
Name: refactor_repository.md
Purpose: instruct AI agents to refactor code safely

---

## Task: Repository Refactor

Goal:

Improve code structure without changing functionality.

---

## Scope

Agents should inspect:

services/
agents/
scripts/

Ignore:

node_modules
venv
dist
build

---

## Refactor Guidelines

Agents may:

• improve naming
• remove duplicate code
• reorganize modules

Agents must NOT:

• remove functionality
• change database schema

---

## Output

Agent should:

1 create refactored files
2 update imports
3 update documentation
4 open pull request
