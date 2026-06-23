---
title: Notas Fiscais
published: true
editor: markdown
description: ''
---

# Notas Fiscais

> **⚠️ Rascunho gerado por agente**
>
> Esta página foi documentada a partir da tela equivalente no ambiente de demonstração do LHISP. A captura usada veio do demo e foi mantida sem marcações visuais.

## Objetivo

Filtrar, emitir e administrar notas fiscais no módulo financeiro, com foco em emissão, organização de lotes e exportação de arquivos.

## Quando usar

Use esta tela quando precisar:

- consultar notas fiscais por filial, plano, série ou período;
- filtrar notas por situação, tipo ou finalidade;
- emitir uma nova nota fiscal;
- baixar arquivos ou planilhas;
- unificar XML ou imprimir a listagem.

## Pré-requisitos

- Estar autenticado no LHISP.
- Ter permissão para acessar o fluxo **Notas Fiscais**.
- Ter grupos, filiais e planos cadastrados para filtragem.
- Conhecer o período de referência da consulta.

## Passo a passo

1. Acesse **Financeiro > Notas Fiscais**.
2. Selecione o **Grupo** e a **Filial**.
3. Ajuste o **Plano** e a **Referência**.
4. Informe a faixa de **Número de Série** e os demais filtros desejados.
5. Use as ações disponíveis para emitir, baixar, imprimir ou exibir os resultados.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| **Grupo** | Grupo empresarial usado como filtro principal. |
| **Filial** | Filial vinculada às notas consultadas. |
| **Plano** | Plano de serviço considerado na filtragem. |
| **Referência** | Mês e ano de referência da consulta. |
| **Número de Série** | Faixa inicial e final de série. |
| **Situação** | Situação geral da nota. |
| **Situação NFCom** | Situação específica da NFCom. |
| **R. Pag.** | Quantidade de registros por página. |
| **Ordenação** | Ordem crescente ou decrescente. |
| **Situação da Fatura** | Estado da fatura vinculada. |
| **Tipo da NF** | Tipo fiscal da nota. |
| **Finalidade da Nota** | Finalidade fiscal selecionada. |
| **Data de Geração** | Faixa de datas para a geração. |
| **+ Emitir** | Inicia a emissão de nova nota. |
| **Baixar Arquivos** | Faz download de arquivos fiscais. |
| **Lotes RPS** | Acessa os lotes RPS. |
| **Imprimir** | Imprime a listagem. |
| **Baixar Planilha** | Exporta os dados em planilha. |
| **Unificar XML** | Consolida XMLs relacionados. |
| **Exibir** | Atualiza/mostra os registros filtrados. |

## Resultado esperado

- A tela exibe a área de filtros e de ações fiscais.
- O operador consegue localizar notas por combinação de filtros.
- As ações de emissão e exportação ficam disponíveis na parte superior da área operacional.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| A lista está vazia | Ajuste os filtros de período, filial ou situação. |
| A filial não aparece | Verifique permissões e cadastros da filial. |
| A ação de emissão não responde | Confirme se há permissões e se os parâmetros obrigatórios foram preenchidos. |

## Observações

- A rota observada no demo foi `/lgc/financeiro%7Cnotafiscal`.
- O conteúdo é renderizado em um iframe legado.
- A tela observada é um painel de filtros e ações, com a listagem abaixo ainda vazia nesta captura.
- O demo já mostra os filtros de **Situação NFCom** e **Tipo da NF**, indicando que esta área concentra diferentes tipos de nota.

## Dúvidas para revisão

- A tela lista notas somente após clicar em **Exibir** ou também após alterar algum filtro?
- Qual a diferença operacional entre **Baixar Arquivos**, **Baixar Planilha** e **Unificar XML** no fluxo real?
- Existe alguma validação adicional para a opção **+ Emitir**?

## Screenshots sugeridos

- Tela **Notas Fiscais** no demo: `assets/screenshots/financeiro/notas-fiscais.png`

![Notas Fiscais no demo](/assets/screenshots/financeiro/notas-fiscais.png)
