---
title: Formas de Pagamento
published: true
editor: markdown
description: ''
---

# Formas de Pagamento

## Objetivo

Documentar a tela de listagem e cadastro de **Formas de Pagamento** em **Cadastros > Financeiro > Formas de Pagamento**.

## Quando usar

Use esta tela quando for necessário:

- consultar formas de pagamento cadastradas;
- cadastrar uma nova forma de pagamento;
- filtrar registros por texto;
- exportar a listagem para planilha.

## Pré-requisitos

- Acesso ao menu **Cadastros > Financeiro > Formas de Pagamento**.
- Permissão para consultar e cadastrar registros financeiros.

## Passo a passo

1. Acesse **Cadastros > Financeiro > Formas de Pagamento**.
2. Use o campo **Procurar** para filtrar a listagem, se necessário.
3. Clique em **Procurar** para executar a busca.
4. Clique em **Cadastrar** para criar uma nova forma de pagamento.
5. Clique em **Baixar Planilha** para exportar a lista exibida.
6. Clique em um item da listagem para abrir o registro correspondente.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| Campo **Procurar** | Campo de filtro textual da listagem. |
| Botão **Procurar** | Executa a pesquisa com o termo informado. |
| **Cadastrar** | Inicia o fluxo de inclusão de uma nova forma de pagamento. |
| **Baixar Planilha** | Exporta a listagem atual para arquivo de planilha. |
| **Id** | Identificador da forma de pagamento. |
| **Descrição** | Nome da forma de pagamento. |
| **Parcelas** | Quantidade de parcelas permitidas. |
| **Entrada (%)** | Percentual de entrada exibido na listagem. |
| **Juros (%)** | Percentual de juros exibido na listagem. |

## Resultado esperado

- A lista de formas de pagamento fica visível com paginação.
- O usuário consegue abrir uma forma de pagamento existente para consulta ou edição.
- O usuário consegue iniciar o cadastro de uma nova forma de pagamento.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| Nenhum resultado aparece | Verifique o termo informado no campo **Procurar**. |
| Registro não abre | Confirme se o usuário possui permissão para consultar o item. |
| Exportação não baixa | Refaça a ação com a listagem já carregada. |

## Observações

- A tela verificada no demo mostra a rota `/cadastros/financeiro/formapagamento`.
- Na listagem do demo, foram observadas formas como **A VISTA**, **2X SEM JUROS**, **3X SEM JUROS**, **4X SEM JUROS** e **ISENTO**.
- Os registros mostram parcelas, entrada e juros por linha.

## Dúvidas para revisão

- O percentual de **Juros** é aplicado automaticamente no checkout ou apenas informativo?
- Existem regras adicionais para formas de pagamento com parcelas?
- A tela aceita outros tipos de composição além de entrada e juros?

## Screenshots sugeridos

- `assets/screenshots/cadastros/financeiro/formas-de-pagamento.png` — captura limpa da listagem de formas de pagamento no demo.

## Captura do demo

![Formas de Pagamento no demo](/assets/screenshots/cadastros/financeiro/formas-de-pagamento.png)
