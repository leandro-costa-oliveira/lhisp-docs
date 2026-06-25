---
title: Ordens de Separação
published: true
editor: markdown
description: ''
---

# Ordens de Separação

> **⚠️ Rascunho gerado por agente**
>
> Esta página foi validada no ambiente de demonstração do LHISP com o fluxo real de criação de ordem para técnico e confirmação de entrega do material.
>
> Veja também a página-resumo do fluxo: [Material para Técnico](/estoque/material-para-tecnico).

## Objetivo

Criar uma ordem de separação para técnico, adicionar itens ao pedido e confirmar a entrega do material na própria ordem.

## Quando usar

Use esta tela quando precisar:

- separar material para um técnico específico;
- abrir uma nova ordem de separação;
- adicionar itens ao pedido;
- confirmar a entrega do material depois da separação.

## Pré-requisitos

- Estar autenticado no LHISP.
- Ter permissão para acessar **Estoque > Ordens de Separação**.
- Ter um almoxarifado válido para a movimentação.
- Ter um técnico responsável disponível para seleção.
- Ter itens de estoque disponíveis para adicionar à ordem.

## Passo a passo

### Criar a ordem

1. Acesse **Estoque > Ordens de Separação**.
2. Clique em **Cadastrar**.
3. Selecione o **Almoxarifado** de origem.
4. Selecione o **Tipo** como **PARA TECNICO**.
5. Escolha o **Técnico Responsável**.
6. Clique em **Adicionar Item**.
7. No diálogo **Adicionar Item**, pesquise ou escolha o produto desejado.
8. Informe a quantidade e clique em **Adicionar**.
9. Confira se o item apareceu na ordem.
10. Clique em **Salvar**.

### Confirmar a entrega

1. Abra a ordem criada na listagem.
2. Localize a ação **Confirmar Entrega**.
3. Clique em **Confirmar Entrega**.
4. Na confirmação exibida, clique em **Ok** para finalizar a entrega.

## O que o demo mostrou com a ordem de teste

No teste realizado, o demo criou uma ordem com os seguintes dados principais:

- **Almoxarifado:** `ALMOXARIFADO GERAL`
- **Tipo:** `PARA TECNICO`
- **Técnico Responsável:** `Fulano de Tal`
- **Status inicial:** `AGUARDANDO_ENTREGA`
- **Item selecionado:** produto de estoque listado no diálogo **Adicionar Item**
- **Quantidade adicionada:** `1`

A ordem criada apareceu na listagem com o resumo:

- **Id:** `40`
- **Almoxarifado:** `ALMOXARIFADO GERAL`
- **Tipo:** `PARA_TECNICO`
- **Destino / Responsável:** `Fulano de Tal`
- **Data:** `6/24/2026`
- **Situação:** `AGUARDANDO_ENTREGA`

Ao abrir a ordem, a tela exibiu as ações:

- **Confirmar Entrega**
- **Adicionar Item**
- **Imprimir**

## Campos importantes

### Na listagem

| Campo / ação | Descrição |
|---|---|
| **Procurar** | Campo de busca textual da tela. |
| **Procurar** | Executa a pesquisa com o termo informado. |
| **Aplicar Filtros** | Aplica os filtros selecionados antes da consulta. |
| **Cadastrar** | Inicia o cadastro de uma nova ordem. |
| **Baixar Planilha** | Exporta os resultados para planilha. |
| **Interface Antiga/Legacy** | Abre a interface legada do fluxo. |
| **First / Last** | Controles de paginação exibidos na área inferior. |

### No cadastro da ordem

| Campo / ação | Descrição |
|---|---|
| **Almoxarifado** | Define o estoque de origem. |
| **Tipo** | Define o tipo da separação. No teste, foi usado **PARA TECNICO**. |
| **Técnico Responsável** | Seleciona o técnico que receberá o material. |
| **Adicionar Item** | Abre o diálogo para escolher o item do estoque. |
| **Salvar** | Grava a ordem depois que ao menos um item foi incluído. |

### No diálogo de itens

| Campo / ação | Descrição |
|---|---|
| **Busca de item** | Campo usado para localizar o produto. |
| **Quantidade** | Quantidade a separar para a ordem. |
| **Adicionar** | Insere o item na ordem. |
| **Remover Item** | Remove o item já incluído. |

### Na ordem aberta

| Campo / ação | Descrição |
|---|---|
| **Confirmar Entrega** | Abre a confirmação final da entrega ao técnico. |
| **Adicionar Item** | Permite incluir mais itens na ordem. |
| **Imprimir** | Gera a impressão da ordem. |

## Resultado esperado

- A ordem é criada para o técnico selecionado.
- O item aparece na lista interna da ordem.
- O status fica em **AGUARDANDO_ENTREGA** até a confirmação final.
- Após **Confirmar Entrega** e **Ok**, a entrega é encerrada no fluxo operacional.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| O botão **Salvar** fica desabilitado | Verifique se o técnico foi selecionado e se ao menos um item foi adicionado. |
| A lista de itens aparece vazia | Use a busca do diálogo e confira se o produto existe no almoxarifado. |
| A ordem não abre | Revise se ela foi salva corretamente e se você está na listagem correta. |
| A confirmação de entrega não aparece | Abra a ordem salva e use a ação **Confirmar Entrega**. |

## Observações

- A rota observada no demo foi `/estoque/ordem_separacao`.
- O cadastro exibiu o título **Ordem de Separação** e o estado inicial sem número antes de salvar.
- Após adicionar o item, o sistema mostrou a ordem na listagem com status **AGUARDANDO_ENTREGA**.
- Ao abrir a ordem, a ação **Confirmar Entrega** ficou disponível junto com **Adicionar Item** e **Imprimir**.
- A confirmação final usa um diálogo simples com os botões **Cancelar** e **Ok**.

## Dúvidas para revisão

- O tipo **PARA TECNICO** é o único usado para esse fluxo ou existem variações por equipe?
- A confirmação de entrega altera alguma informação visível na listagem?
- O botão **Imprimir** gera um PDF, uma visualização ou uma impressão direta?

## Screenshots sugeridos

- Listagem de **Ordens de Separação** no demo: `assets/screenshots/estoque/ordens-de-separacao-listagem.png`
- Cadastro da ordem com técnico selecionado: `assets/screenshots/estoque/ordens-de-separacao-cadastro.png`
- Diálogo **Adicionar Item** aberto: `assets/screenshots/estoque/ordens-de-separacao-adicionar-item.png`
- Ordem aberta com **Confirmar Entrega** visível: `assets/screenshots/estoque/ordens-de-separacao-confirmar-entrega.png`
