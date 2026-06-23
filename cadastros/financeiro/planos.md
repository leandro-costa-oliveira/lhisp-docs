---
title: Planos
published: true
editor: markdown
description: ''
---

# Planos

## Objetivo

Documentar a tela de listagem e cadastro de **Planos** em **Cadastros > Financeiro > Planos**.

## Quando usar

Use esta tela quando for necessário:

- consultar os planos cadastrados;
- cadastrar um novo plano;
- filtrar planos por texto;
- aplicar filtros adicionais;
- exportar a listagem para planilha.

## Pré-requisitos

- Acesso ao menu **Cadastros > Financeiro > Planos**.
- Permissão para consultar e cadastrar registros financeiros.

## Passo a passo

1. Acesse **Cadastros > Financeiro > Planos**.
2. Use o campo **Procurar** para localizar planos por texto.
3. Clique em **Aplicar Filtros** quando houver critérios adicionais a aplicar.
4. Clique em **Procurar** para executar a busca.
5. Clique em **Cadastrar** para criar um novo plano.
6. Clique em **Baixar Planilha** para exportar a listagem atual.
7. Clique em um item da listagem para abrir o registro correspondente.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| Campo **Procurar** | Campo de filtro textual da listagem. |
| **Aplicar Filtros** | Aplica os filtros adicionais disponíveis na tela. |
| **Procurar** | Executa a pesquisa com os critérios informados. |
| **Cadastrar** | Inicia o fluxo de inclusão de um novo plano. |
| **Baixar Planilha** | Exporta a lista exibida em planilha. |
| **Id** | Identificador do plano. |
| **Descrição** | Nome ou descrição do plano. |
| **Valor** | Valor mensal ou preço registrado para o plano. |
| **Situação** | Situação atual do plano, como **ATIVO**. |

## Resultado esperado

- A lista de planos fica visível com paginação.
- O usuário consegue consultar os dados principais do plano.
- O usuário consegue iniciar o cadastro de um novo plano.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| Nenhum resultado aparece | Revise o termo informado no campo **Procurar**. |
| Filtros não mudam a lista | Clique em **Aplicar Filtros** antes de buscar novamente. |
| Exportação não baixa | Refaça a ação com a listagem já carregada. |

## Observações

- A tela verificada no demo mostra a rota `/cadastros/financeiro/planos`.
- Na listagem do demo, foram observados os planos **600M DUPLICADO**, **ACESSO RESIDENCIAL 200mega**, **novo 500mega**, **novo 600mega** e **novo plano para migração**.
- Os itens aparecem com a situação **ATIVO**.

## Dúvidas para revisão

- Há regras diferentes para planos de migração e planos comerciais?
- O campo **Valor** possui alguma validação específica por tipo de plano?
- A tela inclui outros filtros que não ficaram evidentes na listagem do demo?

## Screenshots sugeridos

- `assets/screenshots/cadastros/financeiro/planos.png` — captura limpa da listagem de planos no demo.
