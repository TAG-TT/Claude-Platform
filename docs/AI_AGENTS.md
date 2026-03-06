# AI Agents

Purpose: Define how AI agents interact with this repository.

Supported agents:

- Claude
- OpenAI
- LangChain
- future autonomous agents

---

## Agent Responsibilities

AI agents may:

- analyze code
- generate new code
- write tests
- update documentation
- propose refactors

Agents must NOT:

- commit secrets
- modify infrastructure without review
- push directly to main branch

---

## Repository Awareness

Agents should analyze the following folders:

- agents/
- services/
- infrastructure/
- configs/
- scripts/

Ignore:

- node_modules/
- venv/
- dist/
- build/

---

## Code Generation Rules

When generating code:

1. Use existing architecture
2. Follow repository structure
3. Maintain language consistency

Preferred languages:

- Python
- Node.js
- Go
- Rust

---

## Documentation Behavior

Agents should automatically update:

- README.md
- ARCHITECTURE.md
- DEV_ENVIRONMENT.md

---

## Commit Rules

Agents must create commits with format:

[AI] short description

Example:

[AI] add database migration
[AI] improve error handling

---

## Pull Request Rules

Agents must open PRs instead of direct commits.

PR description must include:

- summary
- changed files
- potential risks

---

## Security Restrictions

Agents must not access:

- .env
- credentials
- secrets/

---

## Model Configuration

OpenAI:

model = gpt-4o

Anthropic:

model = claude-3-5-sonnet-latest

---

## Agent Workflow

Standard AI workflow:

1. analyze repository
2. create task plan
3. generate code
4. run tests
5. open pull request

---

## Future Agents

Planned integrations:

- AutoGPT
- CrewAI
- OpenDevin
- LangGraph
