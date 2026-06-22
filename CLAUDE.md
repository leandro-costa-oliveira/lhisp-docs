# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## About

Documentation site for **LHISP** — an ISP management platform (sistema de gestão para provedores de internet) by LH Sistemas. Built with MkDocs + Material theme, written in Portuguese (pt-BR).

## Commands

```bash
# Install MkDocs and dependencies (Python)
pip install mkdocs-material

# Serve locally with live reload
mkdocs serve

# Build static site
mkdocs build
```

## Architecture

- `mkdocs.yml` — site config, theme, and the full navigation tree (`nav:`). **Adding a new page requires registering it here.**
- `docs/` — all content Markdown files, organized by module:
  - `contratos/` — client contracts workflow (cadastro, serviços, acessos, contas)
  - `financeiro/` — billing (remessa bancária)
  - `rede-infra/` — network/infrastructure (MikroTik, Huawei OLT/BRAS/Switch, CGNAT, IPv6, DNS)
  - `sistema/` — system integrations (API Parceiros, Google Maps)
  - `cadastros/` — administrative records
- `tasks/` — agent task definitions for automated documentation generation from the demo system

## Document structure

Each new guide should follow this structure (defined in `tasks/explore-lhisp-demo.md`):

```
título, objetivo, quando usar, pré-requisitos, passo a passo,
campos importantes, resultado esperado, problemas comuns,
observações, dúvidas para revisão, screenshots sugeridos
```

Screenshots go in `docs/assets/screenshots/{modulo}/`. Agent-generated drafts are saved as `docs/{modulo}/{fluxo}.agent.md`.

## Branch strategy

- **Never commit directly to `main`**. Use `dev` for all new documentation work.
- CI runs on push to `main`, `dev`, and `development`.
- Docker image is built only on `development` or `master` branches.
