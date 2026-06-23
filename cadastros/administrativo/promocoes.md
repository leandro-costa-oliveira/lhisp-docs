---
title: Promoções
published: true
editor: markdown
description: ''
---

# Promoções

> **⚠️ Rascunho gerado por agente**
>
> Esta página foi documentada a partir da tela equivalente no ambiente de demonstração do LHISP. A captura utilizada veio do demo e foi mantida sem marcações visuais.

## Objetivo

Cadastrar e manter promoções com período de vigência, nome e dados básicos exibidos em uma listagem operacional.

## Quando usar

Use esta tela quando precisar:

- localizar uma promoção já cadastrada;
- cadastrar uma nova promoção;
- consultar período de início e término;
- exportar a lista para planilha;
- navegar entre registros da listagem.

## Pré-requisitos

- Estar autenticado no LHISP.
- Ter permissão para acessar o menu **Cadastros > Administrativo > Promoções**.
- Saber o nome da promoção e o período de vigência que será cadastrado ou consultado.

## Passo a passo

1. Acesse **Cadastros > Administrativo > Promoções**.
2. Use o campo **Procurar** para localizar uma promoção já existente.
3. Clique no botão de busca para executar o filtro.
4. Clique em **Cadastrar** para iniciar uma nova promoção.
5. Use **Baixar Planilha** para exportar a listagem exibida.
6. Selecione um item da lista para consultar os dados detalhados.
7. Navegue entre páginas quando houver mais resultados.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| **Procurar** | Campo de busca textual para localizar promoções. |
| **Botão de busca** | Executa a consulta com o termo digitado. |
| **Cadastrar** | Inicia o cadastro de uma nova promoção. |
| **Baixar Planilha** | Exporta a listagem em arquivo de planilha. |
| **Id** | Identificador da promoção. |
| **Nome** | Nome exibido para a promoção. |
| **Data Inicial** | Início da vigência. |
| **Data Final** | Término da vigência. |

## Resultado esperado

- A listagem mostra as promoções cadastradas com período de vigência.
- O operador consegue consultar, cadastrar e exportar os registros.
- O período de cada promoção fica visível para validação rápida.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| A promoção não aparece na lista | Refine a pesquisa pelo nome ou verifique a paginação. |
| A data final aparece vazia | Confirme se a promoção está sem vencimento definido. |
| O cadastro não abre | Verifique se a sessão está ativa e se há permissão suficiente. |
| A exportação não gera arquivo | Refaça a busca e tente novamente com a listagem carregada. |

## Observações

- O demo exibe **Promoções** como uma tela de listagem, com busca, criação e exportação.
- Os itens visíveis na lista mostram **Id**, **Nome**, **Data Inicial** e **Data Final**.
- A tela permite consultar promoções como **promo teste**, **desconto até vencimento** e outras entradas já cadastradas no demo.
- A captura usada nesta página veio do ambiente de demonstração.

## Dúvidas para revisão

- O botão de busca é rotulado apenas com ícone ou existe label textual em alguma outra resolução?
- O cadastro exige campos adicionais além de nome e período de vigência?
- A lista é filtrada por status ativo/inativo ou apenas por texto livre?
- A exportação inclui todos os registros ou somente a página atual?

## Screenshots sugeridos

- Tela **Promoções** no demo: `assets/screenshots/cadastros/administrativo/promocoes.png`

![Promoções no demo](/assets/screenshots/cadastros/administrativo/promocoes.png)
