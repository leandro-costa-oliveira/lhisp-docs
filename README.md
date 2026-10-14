# Documentação do LHISP

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

Guias operacionais em português, publicados no Wiki.js pelo módulo de armazenamento Git. Comece por [home.md](home.md).

A documentação **ainda tem lacunas**. O [relatório de auditoria de 14/10/2026](.tracking/auditoria-2026-10-14.md) registra correções, prioridades e limites. As referências de código e a cobertura ficam em [.tracking/referencias-de-codigo.md](.tracking/referencias-de-codigo.md); esses arquivos internos não são páginas da wiki.

## Organização

- Diretórios de módulos contêm páginas; `operacao/` reúne referências técnicas de arquitetura e banco.
- Cada página Wiki.js usa frontmatter com `title`, `description`, `published` e `editor: markdown`.
- Links entre páginas usam caminhos absolutos sem `.md`: `/contratos/contrato`.
- Capturas ficam em `assets/screenshots/` e devem existir antes de serem referenciadas.
- Novas páginas precisam de links no guia relacionado ou em `home.md` para facilitar a descoberta.

## Revisar e validar

Use a branch `dev`. Confronte interface, API, regras PHP/Node e serviços envolvidos. Registre hashes e alterações locais das fontes; um hash observado não comprova revisão integral do repositório. Preserve o aviso de IA nas páginas alteradas.

```bash
python3 scripts/validar-documentacao.py
git diff --check
```

O validador usa apenas a biblioteca padrão do Python 3.9+ e o Git. Verifica metadados essenciais e destinos de links/imagens Markdown locais. Não valida âncoras, links externos, sintaxe YAML completa ou o comportamento das telas.

## Visualização local

`docker-compose-dev.yaml` define Wiki.js e PostgreSQL. Requer um arquivo `.env` local, não incluído; as variáveis previstas são `WIKI_PORT`, `POSTGRES_PORT`, `WIKI_DB_USER`, `WIKI_DB_PASSWORD` e `WIKI_DB_NAME`.

```bash
docker compose -f docker-compose-dev.yaml up -d
```

O comando inicia os serviços, mas não importa automaticamente este checkout. Configure o armazenamento Git e as permissões no Wiki.js local. Não versione `.env`, credenciais ou chaves do diretório `wiki-ssh/`.
