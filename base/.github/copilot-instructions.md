# GitHub Copilot Instructions — Aramiworks

## Company Context

Aramiworks (주식회사 아람이) builds AI-first automation systems using OpenClaw agents.

## Coding Style

- TypeScript with strict mode
- Conventional Commits for all commit messages
- pnpm for package management
- Zod for runtime validation

## Agent System

This company runs OpenClaw agents (Arami, Ops, Work, Life, Projects). Agent repos follow AGENTS.md conventions.

## Key Rules

1. No secrets in code — use env vars
2. Small functions and files
3. Korean OK for internal comments
4. Validate all external inputs
5. PR-first workflow — no direct pushes
