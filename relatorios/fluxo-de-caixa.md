---
title: Fluxo de Caixa
published: true
editor: markdown
description: ''
---

# Fluxo de Caixa

> **⚠️ Rascunho gerado por agente**
>
> Esta página foi documentada a partir da tela equivalente no ambiente de demonstração do LHISP. A captura utilizada veio do demo e foi mantida sem marcações visuais.

## Objetivo

Consultar o relatório de fluxo de caixa por caixa, período, tipo de movimentação e descrição.

## Quando usar

Use esta tela quando precisar:

- conferir entradas, saídas ou todos os movimentos do caixa;
- filtrar um período específico;
- restringir o relatório por caixa;
- localizar lançamentos por descrição;
- emitir ou baixar a saída do relatório.

## Pré-requisitos

- Estar autenticado no LHISP.
- Ter acesso ao menu **Relatórios > Fluxo de Caixa**.
- Ter caixas e movimentações cadastrados para consulta.

## Passo a passo

1. Acesse o menu **Relatórios > Fluxo de Caixa**.
2. Selecione o **Caixa** desejado.
3. Informe o **Período** inicial e final.
4. Escolha o **Tipo de Movimentação** entre **Entradas**, **Saídas** ou **Todos**.
5. Preencha a **Descrição** quando quiser filtrar por texto.
6. Clique em **Exibir** para gerar o relatório.
7. Use **Imprimir** ou **Baixar Arquivo** conforme a necessidade.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| **Caixa** | Seleção do caixa que será usado na consulta. |
| **Período** | Data inicial e final do relatório. |
| **Tipo de Movimentação** | Define se o relatório mostra entradas, saídas ou todos os movimentos. |
| **Descrição** | Filtro textual para localizar lançamentos específicos. |
| **Exibir** | Executa a consulta do relatório. |
| **Imprimir** | Abre a saída para impressão. |
| **Baixar Arquivo** | Faz o download da saída do relatório. |

## Resultado esperado

- O sistema exibe os movimentos financeiros conforme os filtros selecionados.
- O relatório pode ser impresso ou baixado.
- O operador consegue revisar o caixa sem sair da tela.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| O relatório vem vazio | Verifique o caixa, o período e o tipo de movimentação. |
| A data está fora do esperado | Confirme se o período foi preenchido corretamente. |
| Não há caixas na lista | Confira o cadastro de caixas e as permissões do usuário. |
| A exportação não abre | Teste novamente após gerar o relatório com **Exibir**. |

## Observações

- No demo, a tela equivalente aparece como **Relatório de Fluxo de Caixa**.
- A captura mostra a tela inicial do relatório, antes da execução de uma consulta.
- A área central fica em branco até o usuário clicar em **Exibir**.
- A captura usada nesta página veio do ambiente de demonstração.

## Dúvidas para revisão

- A saída de **Baixar Arquivo** gera qual formato de arquivo?
- Existe algum filtro adicional que não aparece na tela inicial do demo?
- O relatório muda de layout após clicar em **Exibir**?

## Screenshots sugeridos

- Tela **Relatório de Fluxo de Caixa** no demo: `assets/screenshots/relatorios/fluxo-de-caixa.png`

![Fluxo de Caixa no demo](/assets/screenshots/relatorios/fluxo-de-caixa.png)
