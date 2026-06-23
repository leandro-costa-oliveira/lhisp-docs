# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## About

Documentation for **LHISP** — an ISP management platform (sistema de gestão para provedores de internet) by LH Sistemas. A collection of Markdown files (Portuguese, pt-BR) consumed by **Wiki.js** through its **Git storage** module.

## How it works

- Markdown files live at the **repository root**, organized into one folder per module. Wiki.js syncs the repo and maps each file path to a page path (e.g. `contratos/contrato.md` → page `/contratos/contrato`). **No central navigation file** — the folder tree *is* the structure; adding a page just means adding a Markdown file in the right folder.
- Each page starts with YAML frontmatter that Wiki.js reads:
  ```yaml
  ---
  title: ...
  description: ''
  published: true
  editor: markdown
  ---
  ```
- `docker-compose-dev.yaml` runs Wiki.js + Postgres locally for development.

## Architecture

- Content folders (at repo root), organized by module:
  - `contratos/` — client contracts workflow (cadastro, serviços, acessos, contas)
  - `financeiro/` — billing (remessa bancária)
  - `rede-infra/` — network/infrastructure (MikroTik, Huawei OLT/BRAS/Switch, CGNAT, IPv6, DNS)
  - `sistema/` — system integrations (API Parceiros, Google Maps)
  - `cadastros/` — administrative records
  - `relatorios/`, `estoque/`, `dashboards/`, etc.
- `assets/screenshots/{modulo}/` — images. Reference them with **absolute** paths from the wiki root: `![alt](/assets/screenshots/modulo/arquivo.png)`.
- `tasks/` — agent task definitions for automated documentation generation from the demo system.

## Markdown conventions (Wiki.js)

- **No MkDocs admonitions** (`!!! warning`). Use blockquotes instead: `> **⚠️ Atenção**`.
- Internal links use absolute, extension-less paths: `[texto](/contratos/contrato)`.
- Image links use absolute paths: `/assets/screenshots/...`.

## Document structure

Each new guide should follow this structure (defined in `tasks/explore-lhisp-demo.md`):

```
título, objetivo, quando usar, pré-requisitos, passo a passo,
campos importantes, resultado esperado, problemas comuns,
observações, dúvidas para revisão, screenshots sugeridos
```

Screenshots go in `assets/screenshots/{modulo}/`.

## Branch strategy

- **Never commit directly to `main`**. Use `dev` for all new documentation work.
