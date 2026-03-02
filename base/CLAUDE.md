# Aramiworks — Claude Code Context

## Company

**Aramiworks** (주식회사 아람이) is an AI-first company building intelligent automation systems.

- Founder: Jace (Jaemin Cheun)
- Language: Korean (primary), English (technical docs)
- Stack: TypeScript/Node.js, AI agents (OpenClaw), GitHub-centric workflows

## Development Philosophy

- **AI-first**: Every repo should be AI-tool-friendly (this file, `.cursor/rules/`, `AGENTS.md`)
- **Conventional Commits**: `feat:`, `fix:`, `chore:`, `docs:`, `refactor:`, `perf:`
- **Small PRs**: <400 lines preferred; draft PRs for WIP
- **Korean OK**: Code comments and internal docs can be in Korean

## Coding Standards

- TypeScript strict mode preferred
- Zod for runtime validation
- pnpm for package management
- Biome or ESLint for linting

## Git / PR Rules

- Branch: `feature/xxx`, `fix/xxx`, `chore/xxx`
- PR title must follow Conventional Commits format
- All changes via PR — no direct push to main/master
- Linear issue reference in PR when applicable

## Security

- Never commit secrets, API keys, or tokens
- Use environment variables or 1Password
- GitHub Secret Scanning is enabled on all repos

## Agent System (OpenClaw)

This company runs an AI agent system (OpenClaw) with multiple specialized agents:
- **Arami** 🌊 — Main coordinator
- **Ops** 🔧 — Infrastructure, GitHub, automation
- **Work** 💼 — Work tasks, emails, scheduling
- **Life** 🌿 — Personal tasks
- **Projects** 🚀 — Project management

When working in agent-related repos, follow the AGENTS.md in this repo.
