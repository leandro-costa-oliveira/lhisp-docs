---
title: Ordens de Separação
published: true
editor: markdown
description: ''
---

# Ordens de Separação

> **⚠️ Rascunho gerado por agente**
>
> Esta página foi documentada a partir da tela equivalente no ambiente de demonstração do LHISP. A captura usada veio do demo e foi mantida sem marcações visuais.

## Objetivo

Pesquisar e gerenciar ordens de separação no módulo de estoque, com acesso a filtros, cadastro e exportação.

## Quando usar

Use esta tela quando precisar:

- localizar ordens de separação por texto livre;
- aplicar filtros antes da consulta;
- cadastrar uma nova ordem;
- baixar a planilha com os dados;
- alternar para a interface legada, se necessário.

## Pré-requisitos

- Estar autenticado no LHISP.
- Ter permissão para acessar o fluxo **Ordens de Separação**.
- Saber o termo ou critério que será pesquisado.

## Passo a passo

1. Acesse **Estoque > Ordens de Separação**.
2. Informe o termo desejado no campo **Procurar**.
3. Use **Procurar** ou **Aplicar Filtros** para executar a busca.
4. Se necessário, clique em **Cadastrar** para criar uma nova ordem.
5. Use **Baixar Planilha** para exportar os resultados.
6. Clique em **Interface Antiga/Legacy** se precisar alternar para o fluxo legado.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| **Procurar** | Campo de busca textual da tela. |
| **Procurar** | Executa a pesquisa com o termo informado. |
| **Aplicar Filtros** | Aplica os filtros selecionados antes da consulta. |
| **Cadastrar** | Inicia o cadastro de uma nova ordem. |
| **Baixar Planilha** | Exporta os resultados para planilha. |
| **Interface Antiga/Legacy** | Abre a interface legada do fluxo. |
| **First / Last** | Controles de paginação exibidos na área inferior. |

## Resultado esperado

- A tela permite pesquisar ordens de separação rapidamente.
- O operador consegue abrir o cadastro ou exportar a listagem.
- A navegação entre páginas aparece na parte inferior quando há resultados.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| A busca não retorna resultados | Tente outro termo ou aplique filtros diferentes. |
| O cadastro não abre | Verifique permissão do perfil. |
| A exportação não gera arquivo | Revise os filtros e aguarde a resposta do sistema. |

## Observações

- A rota observada no demo foi `/estoque/ordem_separacao`.
- A captura visual mostra uma tela limpa, com a área de busca e ações no topo e a paginação no rodapé da área de listagem.
- O conteúdo principal aparece vazio nesta captura, sem registros listados.
- A tela é apresentada como página operacional normal, não como iframe legado.

## Dúvidas para revisão

- A listagem vazia indica ausência de ordens ou falta de filtros?
- O botão **Aplicar Filtros** faz algo diferente de **Procurar**?
- O item **Interface Antiga/Legacy** abre uma versão equivalente ou outro fluxo relacionado?

## Screenshots sugeridos

- Tela **Ordens de Separação** no demo: `assets/screenshots/estoque/ordens-de-separacao.png`

![Ordens de Separação no demo](/assets/screenshots/estoque/ordens-de-separacao.png)
