---
title: Produtos
published: true
editor: markdown
description: ''
---

# Produtos

## Objetivo

Documentar a tela de listagem e cadastro de **Produtos** em **Cadastros > Estoque > Produtos**.

## Quando usar

Use esta tela quando for necessário:

- consultar produtos cadastrados;
- cadastrar um novo produto;
- filtrar registros por texto;
- exportar a listagem para planilha.

## Pré-requisitos

- Acesso ao menu **Cadastros > Estoque > Produtos**.
- Permissão para consultar e cadastrar registros de estoque.

## Passo a passo

1. Acesse **Cadastros > Estoque > Produtos**.
2. Use o campo **Procurar** para filtrar a listagem, se necessário.
3. Clique em **Procurar** para executar a busca.
4. Clique em **Cadastrar** para criar um novo produto.
5. Clique em **Baixar Planilha** para exportar a lista exibida.
6. Clique em um item da listagem para abrir o registro correspondente.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| Campo **Procurar** | Campo de filtro textual da listagem. |
| Botão **Procurar** | Executa a pesquisa com o termo informado. |
| **Cadastrar** | Inicia o fluxo de inclusão de um novo produto. |
| **Baixar Planilha** | Exporta a listagem atual para arquivo de planilha. |
| **Id** | Identificador do produto. |
| **Produto** | Nome do item exibido na listagem. |

## Resultado esperado

- A lista de produtos fica visível com paginação.
- O usuário consegue abrir um produto existente para consulta ou edição.
- O usuário consegue iniciar o cadastro de um novo produto.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| Nenhum resultado aparece | Verifique o termo informado no campo **Procurar**. |
| Registro não abre | Confirme se o usuário possui permissão para consultar o item. |
| Exportação não baixa | Refaça a ação com a listagem já carregada. |

## Observações

- A tela verificada no demo mostra a rota `/cadastros/estoque/produtos`.
- Na listagem do demo, foram observados produtos como **ROTEADOR 2 ANTENAS**, **ROTEADOR 5 ANTENAS**, **ONU ABC**, **ONU FIBERHOME**, **PAPEL A4**, **DETERGENTE**, **HUAWEI AX3** e **Drop SUMEC**.
- A tela funciona como uma listagem administrativa simples de estoque.

## Dúvidas para revisão

- Existe algum vínculo obrigatório entre produto, categoria e almoxarifado?
- O cadastro de produto possui campos adicionais que não aparecem na listagem?
- O sistema aceita variações ou apenas itens simples de estoque?

## Screenshots sugeridos

- `assets/screenshots/cadastros/estoque/produtos.png` — captura limpa da listagem de produtos no demo.

## Captura do demo

![Produtos no demo](/assets/screenshots/cadastros/estoque/produtos.png)
