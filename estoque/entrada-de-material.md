---
title: Entrada de Material
published: true
editor: markdown
description: ''
---

# Entrada de Material

> **⚠️ Rascunho gerado por agente**
>
> Esta página documenta o caminho manual de entrada de material a partir de **Almoxarifados**, usando a janela **Nova Movimentação** observada no demo.
>
> Veja também a página-resumo do fluxo: [Material para Técnico](/estoque/material-para-tecnico).

## Objetivo

Registrar a entrada manual de material no estoque a partir do menu **Almoxarifados**.

## Quando usar

Use este fluxo quando o material entrar no estoque sem passar pelo caminho de nota fiscal de compra ou quando for necessário fazer uma movimentação manual controlada.

## Pré-requisitos

- Estar autenticado no LHISP.
- Ter acesso ao menu **Almoxarifados**.
- Ter ao menos um almoxarifado, local, categoria e produto disponíveis para teste.

## Passo a passo

1. Acesse **Almoxarifados**.
2. Selecione o **Almoxarifado** desejado.
3. Selecione o **Local** de estoque.
4. Filtre por **Categoria** e, se necessário, por **Produto**.
5. Clique em **Adicionar Movimentação**.
6. Na janela **Nova Movimentação**, clique em **Entrada**.
7. Use o campo **Procurar por** para localizar o produto, se necessário.
8. Observe a lista de itens exibida na janela.
9. Selecione o produto desejado para continuar o fluxo operacional.
10. Siga a confirmação final da movimentação conforme a ação disponível no diálogo.

## O que o demo mostrou na janela Nova Movimentação

A janela aberta pelo botão de inclusão apresenta:

- campo de busca **Procurar por**;
- lista com colunas **Id**, **Produto** e **Controle Patrimonial**;
- produtos como **ROTEADOR 2 ANTENAS**, **ROTEADOR 5 ANTENAS**, **ONU ABC**, **ONU FIBERHOME**, **ROTEADOR TPLINK 2 ANTENTAS**, **ROTEADOR TPLINK 4 ANTENAS**, **PAPEL A4** e **HUAWEI AX3**.

Cada linha da listagem expõe duas ações com título visível no HTML do demo:

| Botão | Título observado | Uso |
|---|---|---|
| **H** | **Histórico de Movimentações do Produto** | Abre o histórico do item. |
| **T** | **Transferir de Local** | Inicia a transferência do item entre locais. |

## Campos importantes

### Na tela principal de Almoxarifados

| Campo / ação | Descrição |
|---|---|
| **Almoxarifado** | Unidade de estoque selecionada. O demo mostrou opções como **ALMOXARIFADO GERAL**, **FILIAL 2** e **MATRIZ**. |
| **Local** | Local interno do estoque. O demo mostrou opções como **A001**, **A002**, **Prateleira de cima**, **Prateleira do meio** e **Prateleira de baixo**. |
| **Categoria** | Categoria usada para filtrar os produtos. |
| **Exibir Somente Produtos da iCategoria Selecionada !** | Mantém a listagem limitada à categoria marcada. |
| **Produto** | Filtro textual da listagem. |
| **Exibir Produtos com Estoque Zero ?** | Inclui produtos sem saldo. |
| **Atualizar Listagem** | Recarrega os itens filtrados. |
| **Imprimir** | Gera impressão da listagem. |
| **Adicionar Movimentação** | Abre a janela **Nova Movimentação**. |

### Na janela Nova Movimentação

| Campo / ação | Descrição |
|---|---|
| **Procurar por** | Busca textual para localizar um produto no estoque. |
| **Entrada** | Inicia o fluxo de entrada manual. |
| **Saída** | Alterna para o fluxo de saída. |
| **Id / Produto / Controle Patrimonial** | Colunas da listagem de produtos exibida no diálogo. |

## Resultado esperado

- A lista de produtos do almoxarifado fica visível e filtrável.
- A janela **Nova Movimentação** abre corretamente.
- O operador consegue localizar o produto e seguir para o fluxo de movimentação.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| A lista não carrega | Confirme se o **Almoxarifado** e o **Local** foram selecionados. |
| O botão **Adicionar Movimentação** fica desabilitado | Verifique se a seleção de almoxarifado/local foi feita corretamente. |
| Não encontro o produto na janela | Use **Procurar por** e revise se a categoria está filtrada corretamente. |

## Observações

- O demo mostrou a janela **Nova Movimentação** como um diálogo sobreposto à tela principal de Almoxarifados.
- A seleção de **Entrada** abre uma lista de produtos disponíveis no estoque, com informações de controle patrimonial.
- As ações **H** e **T** têm significado claro no HTML do demo: histórico e transferência de local.
- A confirmação final da movimentação precisa ser validada no próximo passo de exploração, caso o fluxo operacional exija outro botão ou formulário após a seleção do produto.

## Dúvidas para revisão

- A entrada manual grava a movimentação ao clicar em qual ação final?
- Depois de selecionar **Entrada**, o sistema exige quantidade, local de destino ou apenas a seleção do item?
- O botão **T** é usado para o fluxo de transferência ou também aparece no caminho de entrada manual?

## Screenshots sugeridos

- Tela **Almoxarifados** no demo: `assets/screenshots/estoque/almoxarifados.png`
- Janela **Nova Movimentação** no demo: `assets/screenshots/estoque/nova-movimentacao.png`
