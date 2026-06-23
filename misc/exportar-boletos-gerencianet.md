---
title: Exportar Boletos do Gerencianet
published: true
editor: markdown
description: ''
---

# Exportar Boletos do Gerencianet

> **⚠️ Rascunho gerado por agente**
>
> Este documento foi produzido a partir da exploração da wiki do LHISP e da tela equivalente no ambiente de demonstração.

## Objetivo

Documentar o fluxo de exportação/seleção de boletos vinculados ao Gerencianet, permitindo filtrar contratos, período de faturamento e opções de impressão.

## Quando usar

Use este fluxo quando for necessário:

- gerar um conjunto de boletos para impressão;
- filtrar por filial, conta bancária, rede e setor;
- revisar quais contratos entram na exportação;
- preparar a impressão em lote.

## Pré-requisitos

- Acesso ao menu de relatórios ou financeiro relacionado à impressão/exportação de boletos.
- Filial, contas e planos previamente cadastrados.
- Permissão para visualizar os contratos e filtros de faturamento.

## Passo a passo

1. Abra a tela de exportação de boletos.
2. Selecione a **Filial** e a **Conta Bancária** desejadas.
3. Ajuste **Setor de Rede**, **Rede** e **Vencimento**, se necessário.
4. Defina se deseja listar **Não Impressos**, **Impressos** ou **Todos**.
5. Informe filtros adicionais como **UF**, **Cidade**, **Bairro** e **Logradouro**.
6. Escolha o **Plano** e o período de **Faturamento**.
7. Selecione a quantidade de **Contratos** e a **Página**.
8. Clique em **Confirmar**, **Imprimir** ou **Exibir** conforme a necessidade.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| **Filial** | Filtra os boletos por unidade. |
| **Conta Bancária** | Conta usada para a emissão/impressão. |
| **Setor de Rede / Rede** | Restringe a seleção pelo agrupamento da infraestrutura. |
| **Vencimento** | Filtra os boletos por dia de vencimento. |
| **Imprimir** | Alterna entre não impressos, impressos ou todos. |
| **Faturamento** | Período usado para montar a lista de boletos. |
| **Contratos** | Quantidade de contratos exibidos por página. |
| **Confirmar / Imprimir / Exibir** | Ações finais da tela. |

## Resultado esperado

- A listagem de boletos fica filtrada conforme os critérios escolhidos.
- O operador consegue confirmar, exibir ou imprimir os carnês/boletos.
- O fluxo fica pronto para uso operacional.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| Lista vazia | Verifique os filtros de filial, conta, período e plano. |
| Boletos errados | Confirme se o vencimento e o tipo de impressão foram selecionados corretamente. |
| Filtros não retornam contratos | Valide se há contratos ativos no período selecionado. |

## Observações

- A wiki descreve este fluxo como **Exportar Boletos do Gerencianet**.
- No demo, a tela equivalente aparece como **Impressão de Carnês**.
- A captura usada nesta página veio do ambiente de demonstração, não da wiki.

## Dúvidas para revisão

- O nome de exibição deve seguir a wiki ou o texto do demo?
- Este fluxo deve morar em **Financeiro** ou em **Misc** na navegação final?
- Há algum filtro adicional que precise ser documentado em uma página separada?

## Screenshots sugeridos

- Tela **Impressão de Carnês** no demo: `assets/screenshots/misc/exportar-boletos-gerencianet.png`

![Exportar Boletos do Gerencianet no demo](/assets/screenshots/misc/exportar-boletos-gerencianet.png)
