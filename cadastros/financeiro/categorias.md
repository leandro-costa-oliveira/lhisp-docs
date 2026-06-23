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
| **iCategoria** | Descrição ou nome da categoria exibida na lista. |

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

- A tela verificada no demo mostra a rota `/cadastros/financeiro/categorias`.
- Na listagem do demo, foram observadas categorias como **QUE CATEGORIA**, **CATEGORICAMENTE CARO**, **despesas financeiras**, **custos e despesas variaveis**, **despesas administrativas**, **amortização**, **impostos** e **despesas pessoal**.
- O demo mostra a coluna com o rótulo **iCategoria** para os registros listados.

## Dúvidas para revisão

- A nomenclatura **iCategoria** é apenas herdada do sistema ou tem significado funcional específico?
- Existem subcategorias ou apenas categorias de primeiro nível?
- A tela aceita outras colunas ou filtros que não ficaram evidentes no demo?

## Screenshots sugeridos

- `assets/screenshots/cadastros/financeiro/categorias.png` — captura limpa da listagem de categorias no demo.

## Captura do demo

![Categorias no demo](/assets/screenshots/cadastros/financeiro/categorias.png)
