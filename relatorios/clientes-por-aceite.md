---
title: Clientes por Aceite
published: true
editor: markdown
description: ''
---

# Clientes por Aceite

## Estado atual

Não foi localizada uma implementação de relatório **Clientes por Aceite** nos repositórios disponíveis.

As buscas incluíram rotas e componentes de relatórios no `lhisp-frontend`, formulários e actions no `lhisp-php`, além de rotas, regras de negócio e modelos no `lhisp-backend`.

## Funcionalidade relacionada localizada

O sistema possui aceite eletrônico de documentos do contrato na central do assinante:

- `web/central/central_principal.php` lista documentos pendentes de aceite;
- `web/central/central_docs.php` registra e apresenta a data do aceite;
- `web/callback/d4sign.php` também grava `DATA_ACEITE` em retorno da assinatura;
- planos podem usar a configuração `exigirAceite`.

Esses fluxos não comprovam a existência de uma tela consolidada **Clientes por Aceite**. Por isso, filtros, colunas, exportação e regras do relatório não são descritos aqui.
