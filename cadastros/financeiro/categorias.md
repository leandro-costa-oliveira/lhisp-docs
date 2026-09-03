---
title: Categorias
published: true
editor: markdown
description: ''
---

# Categorias

## Objetivo

Documentar a tela de listagem e cadastro de **Categorias** em **Cadastros > Financeiro > Categorias**.

## Quando usar

Use esta tela quando for necessário:

- consultar categorias financeiras cadastradas;
- cadastrar uma nova categoria;
- filtrar registros por texto;
- exportar a listagem para planilha.

## Pré-requisitos

- Acesso ao menu **Cadastros > Financeiro > Categorias**.
- Permissão para consultar e cadastrar registros financeiros.

## Passo a passo

1. Acesse **Cadastros > Financeiro > Categorias**.
2. Use o campo **Procurar** para filtrar a listagem, se necessário.
3. Clique em **Procurar** para executar a busca.
4. Clique em **Cadastrar** para criar uma nova categoria.
5. Clique em **Baixar Planilha** para exportar a lista exibida.
6. Clique em um item da listagem para abrir o registro correspondente.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| Campo **Procurar** | Campo de filtro textual da listagem. |
| Botão **Procurar** | Executa a pesquisa com o termo informado. |
| **Cadastrar** | Inicia o fluxo de inclusão de uma nova categoria. |
| **Baixar Planilha** | Exporta a listagem atual para arquivo de planilha. |
| **Id** | Identificador da categoria. |
| **iCategoria** | Nome da categoria. O texto do cabeçalho é literal na implementação atual. |
| **Itens** | O formulário permite adicionar ou remover itens, cada um com nome de até 100 caracteres. |

## Resultado esperado

- A lista de categorias fica visível com paginação.
- O usuário consegue abrir uma categoria existente para consulta ou edição.
- O usuário consegue iniciar o cadastro de uma nova categoria.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| Nenhum resultado aparece | Verifique o termo informado no campo **Procurar**. |
| Registro não abre | Confirme se o usuário possui permissão para consultar o item. |
| Exportação não baixa | Refaça a ação com a listagem já carregada. |

## Observações

- A rota é `/cadastros/financeiro/categorias`.
- A listagem possui dez registros por página e filtra `nome` por ocorrência do texto digitado.
- O formulário implementa uma categoria com uma lista simples de itens; não há hierarquia de subcategorias.

## Screenshots sugeridos

- `assets/screenshots/cadastros/financeiro/categorias.png` — captura limpa da listagem de categorias no demo.

## Captura do demo

![Categorias no demo](/assets/screenshots/cadastros/financeiro/categorias.png)

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.
