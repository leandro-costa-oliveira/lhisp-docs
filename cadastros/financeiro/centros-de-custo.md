---
title: Centros de Custo
published: true
editor: markdown
description: ''
---

# Centros de Custo

## Objetivo

Documentar a tela de listagem e cadastro de **Centros de Custo** em **Cadastros > Financeiro > Centros de Custo**.

## Quando usar

Use esta tela quando for necessário:

- consultar os centros de custo cadastrados;
- cadastrar um novo centro de custo;
- procurar um centro de custo pelo nome;
- transferir itens entre centros de custo;
- exportar a listagem para planilha.

## Pré-requisitos

- Acesso ao menu **Cadastros > Financeiro > Centros de Custo**.
- Permissão para consultar, cadastrar e transferir registros financeiros.

## Passo a passo

1. Acesse **Cadastros > Financeiro > Centros de Custo**.
2. Use o campo **Procurar** para localizar registros.
3. Clique em **Procurar** para executar a busca.
4. Clique em **Cadastrar** para criar um novo centro de custo.
5. Clique em **Baixar Planilha** para exportar a listagem atual.
6. Clique em **Transferir Item de Centro de Custo** para iniciar a movimentação de itens.
7. Clique em um item da lista para abrir o registro correspondente.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| Campo **Procurar** | Campo de filtro textual da listagem. |
| **Procurar** | Executa a pesquisa com o texto digitado. |
| **Cadastrar** | Inicia o fluxo de inclusão de um novo centro de custo. |
| **Baixar Planilha** | Exporta a lista exibida em planilha. |
| **Transferir Item de Centro de Custo** | Abre a função de transferência de itens entre centros de custo. |
| **Id** | Identificador do centro de custo. |
| **Centro de Custo** | Nome do centro de custo cadastrado. |

## Resultado esperado

- A lista de centros de custo fica visível com paginação.
- O usuário consegue abrir um centro de custo existente para consulta ou edição.
- O usuário consegue iniciar o cadastro ou transferência de itens.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| Nenhum resultado aparece | Revise o termo informado no campo **Procurar**. |
| Transferência não abre | Verifique as permissões do usuário para a ação. |
| Exportação não baixa | Refaça a ação com a listagem carregada. |

## Observações

- A tela verificada no demo mostra a rota `/cadastros/financeiro/centro_de_custo`.
- Na listagem do demo, foram observados os centros de custo **DIVERSOS**, **teste1**, **comercial**, **operações**, **administrativo**, **manutenção de veiculos** e **IMPOSTOS**.
- A tela inclui a ação adicional **Transferir Item de Centro de Custo** além das ações de listagem padrão.

## Dúvidas para revisão

- A transferência de itens movimenta quais entidades exatamente?
- Existe alguma relação obrigatória entre centro de custo e planos/contas financeiras?
- A tela possui filtros adicionais que não ficaram evidentes na listagem do demo?

## Screenshots sugeridos

- `assets/screenshots/cadastros/financeiro/centros-de-custo.png` — captura limpa da listagem de centros de custo no demo.
