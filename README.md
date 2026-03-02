# aramiworks/craft

> Aramiworks AI context & development standards — Single Source of Truth for all repos.

This repo provides shared AI context files (`.cursor/rules`, `CLAUDE.md`, `AGENTS.md`, etc.) and development standards for all Aramiworks projects.

## Structure

```
craft/
├── base/                  ← Company-wide (all repos)
│   ├── .cursor/rules/     ← Cursor AI rules
│   ├── CLAUDE.md          ← Claude Code context
│   ├── AGENTS.md          ← OpenClaw agent template
│   ├── .github/copilot-instructions.md
│   └── llms.txt           ← LLM-readable project summary
├── overrides/             ← Repo-type specific additions
│   ├── product/           ← SaaS / product repos
│   ├── agent/             ← AI agent repos
│   ├── library/           ← npm package repos
│   └── infra/             ← Infra / dotfiles repos
├── examples/              ← Ready-to-use examples
│   ├── minimal/
│   └── full/
└── scripts/
    ├── install.sh         ← Initial setup
    └── update.sh          ← Sync latest from craft
```

## Usage

### New repo setup
```bash
curl -sSL https://raw.githubusercontent.com/aramiworks/craft/main/scripts/install.sh | bash -s -- --type product
```

### Update existing repo
```bash
curl -sSL https://raw.githubusercontent.com/aramiworks/craft/main/scripts/update.sh | bash
```

### Repo types
| Type | Use when |
|------|----------|
| `product` | SaaS app, web product |
| `agent` | AI agent / OpenClaw automation |
| `library` | npm package, SDK |
| `infra` | Dotfiles, config, infra |

## Philosophy

- **SSOT**: One place to update AI context — propagates to all repos via `update.sh`
- **Layered**: `base/` applies everywhere; `overrides/<type>/` adds repo-specific context
- **Scripts over submodules**: No git submodule complexity — simple copy + update
