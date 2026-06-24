---
title: Notas Fiscais de Compra
published: true
editor: markdown
description: ''
---

# Notas Fiscais de Compra

> **⚠️ Rascunho gerado por agente**
>
> Esta página foi documentada a partir da tela equivalente no ambiente de demonstração do LHISP. A captura usada veio do demo e foi mantida sem marcações visuais.

## Objetivo

Pesquisar e administrar notas fiscais de compra no módulo de estoque, com ações de consulta, filtragem, cadastro e exportação.

## Quando usar

Use esta tela quando precisar:

- localizar notas fiscais de compra por termo livre;
- aplicar filtros antes da consulta;
- cadastrar uma nova nota;
- baixar a planilha com os resultados.

## Pré-requisitos

- Estar autenticado no LHISP.
- Ter permissão para acessar o fluxo **Notas Fiscais de Compra**.
- Conhecer o termo ou critério que será pesquisado.

## Passo a passo

1. Acesse **Estoque > Notas Fiscais de Compra**.
2. Informe o termo desejado no campo **Procurar**.
3. Use **Procurar** ou **Aplicar Filtros** para executar a busca.
4. Se necessário, clique em **Cadastrar** para iniciar uma nova nota.
5. Use **Baixar Planilha** para exportar os resultados.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| **Procurar** | Campo de busca textual da tela. |
| **Procurar** | Executa a pesquisa com o termo informado. |
| **Aplicar Filtros** | Aplica os filtros disponíveis antes da consulta. |
| **Cadastrar** | Inicia o cadastro de uma nova nota fiscal de compra. |
| **Baixar Planilha** | Exporta os resultados para planilha. |
| **First / Last** | Controles de paginação exibidos abaixo da listagem. |

## Resultado esperado

- A tela permite pesquisar notas de compra rapidamente.
- O operador consegue abrir o cadastro ou exportar a listagem.
- A paginação aparece quando existem registros para navegação.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| A busca não retorna resultados | Tente outro termo ou aplique filtros diferentes. |
| O cadastro não abre | Verifique a permissão do perfil. |
| A exportação não gera arquivo | Revise os filtros e aguarde a resposta do sistema. |

## Observações

- A rota observada no demo foi `/estoque/notas_fiscais_compra`.
- A tela aparece como página operacional normal.
- A captura limpa mostra apenas o campo **Procurar**, os botões de ação e a paginação, sem registros listados.
- O conteúdo principal permanece vazio nesta captura.

## Dúvidas para revisão

- A busca aciona a listagem imediatamente ou depende de filtros adicionais?
- O botão **Aplicar Filtros** abre um painel adicional ou apenas executa a pesquisa?
- Existe algum fluxo de edição além de **Cadastrar**?

## Screenshots sugeridos

- Tela **Notas Fiscais de Compra** no demo: `assets/screenshots/estoque/notas-fiscais-de-compra.png`

![Notas Fiscais de Compra no demo](/assets/screenshots/estoque/notas-fiscais-de-compra.png)
