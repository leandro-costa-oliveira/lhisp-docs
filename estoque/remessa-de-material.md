---
title: Remessa de Material
published: true
editor: markdown
description: ''
---

# Remessa de Material

> **⚠️ Rascunho gerado por agente**
>
> Esta página foi documentada a partir da tela equivalente no ambiente de demonstração do LHISP. A captura usada veio do demo e foi mantida sem marcações visuais.

## Objetivo

Pesquisar e gerenciar remessas de material entre almoxarifados, com consulta, filtros, cadastro e exportação.

## Quando usar

Use esta tela quando precisar:

- localizar remessas por texto livre;
- aplicar filtros antes da consulta;
- cadastrar uma nova remessa;
- baixar a planilha com os dados;
- acompanhar o status da remessa listada.

## Pré-requisitos

- Estar autenticado no LHISP.
- Ter permissão para acessar o fluxo **Remessa de Material**.
- Saber o critério ou termo que será pesquisado.

## Passo a passo

1. Acesse **Estoque > Remessa de Material**.
2. Informe o termo desejado no campo **Procurar**.
3. Use **Procurar** ou **Aplicar Filtros** para executar a busca.
4. Se necessário, clique em **Cadastrar** para iniciar uma nova remessa.
5. Use **Baixar Planilha** para exportar os resultados.
6. Acompanhe o registro listado e a situação da remessa.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| **Procurar** | Campo de busca textual da tela. |
| **Procurar** | Executa a pesquisa com o termo informado. |
| **Aplicar Filtros** | Aplica filtros adicionais antes da consulta. |
| **Cadastrar** | Inicia o cadastro de uma nova remessa. |
| **Baixar Planilha** | Exporta os resultados para planilha. |
| **Id** | Identificador da remessa listada. |
| **Almoxarifado de Origem** | Almoxarifado de saída. |
| **Almoxarifado de Destino** | Almoxarifado de chegada. |
| **Data** | Data registrada para a remessa. |
| **Situação** | Estado atual da remessa. |
| **Paginação** | Navegação entre páginas de resultado. |

## Resultado esperado

- A tela permite pesquisar remessas rapidamente.
- O operador consegue abrir o cadastro ou exportar a listagem.
- A grade mostra os dados principais da remessa, incluindo origem, destino, data e situação.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| A busca não retorna resultados | Tente outro termo ou aplique filtros diferentes. |
| O cadastro não abre | Verifique a permissão do perfil. |
| A exportação não gera arquivo | Revise os filtros e aguarde a resposta do sistema. |

## Observações

- A rota observada no demo foi `/estoque/remessas_de_materiais`.
- A captura limpa mostra o campo de busca, os botões de ação e uma grade com uma remessa listada.
- A remessa exibida na captura tinha **Id 10**, **ALMOXARIFADO GERAL** como origem, **FILIAL 2** como destino, data **12/23/2025** e situação **EM_ABERTO**.
- A tela é operacional normal.

## Dúvidas para revisão

- A lista apresenta apenas remessas em aberto ou inclui outros status?
- O botão **Aplicar Filtros** abre um painel adicional ou apenas executa a pesquisa?
- Existe algum fluxo de edição ou detalhamento além do cadastro direto?

## Screenshots sugeridos

- Tela **Remessa de Material** no demo: `assets/screenshots/estoque/remessa-de-material.png`

![Remessa de Material no demo](/assets/screenshots/estoque/remessa-de-material.png)
