---
title: Categorias
published: true
editor: markdown
description: ''
---

# Categorias

> **⚠️ Rascunho gerado por agente**
>
> Esta página foi documentada a partir da tela equivalente no ambiente de demonstração do LHISP.
> O fluxo observado abriu dentro do *frame* legado do sistema, com uma tela simples de cadastro de categoria de estoque.
>
> Veja também a trilha completa: [Material para Técnico](/estoque/material-para-tecnico).

## Objetivo

Cadastrar e consultar categorias de estoque usadas na organização dos produtos do almoxarifado.

## Quando usar

Use esta tela quando for necessário:

- criar uma nova categoria para produtos de estoque;
- consultar uma categoria já cadastrada;
- editar ou apagar uma categoria existente;
- preparar a base para cadastro de produtos e entradas de material.

## Pré-requisitos

- Estar autenticado no LHISP.
- Ter permissão para acessar **Cadastros > Estoque > Categorias**.
- Saber o nome que será usado para a categoria.

## Passo a passo

1. Acesse **Cadastros > Estoque > Categorias**.
2. Na tela carregada, use **Novo** para iniciar um cadastro vazio.
3. Preencha o campo **Nome** com a descrição da categoria.
4. Clique em **Salvar** para gravar o registro.
5. Se necessário, use **Anterior** e **Próximo** para navegar entre registros.
6. Use **Editar** para alterar a categoria selecionada.
7. Use **Apagar** para remover a categoria, quando permitido.
8. Use **Cancelar** para sair do modo de edição/inclusão sem gravar.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| **Nome** | Nome da categoria de estoque. Foi o único campo visível na tela observada. |
| **Novo** | Inicia o cadastro de uma categoria nova. |
| **Editar** | Permite alterar o registro atual. |
| **Apagar** | Remove o registro atual, quando o perfil permite. |
| **Salvar** | Grava a categoria criada ou editada. |
| **Cancelar** | Cancela a inclusão/edição em andamento. |
| **Anterior / Próximo** | Navegam pelos registros existentes. |
| **Procurar** | Abre a busca de categorias já cadastradas. |

## Resultado esperado

- A categoria fica cadastrada e disponível para uso em cadastros de estoque.
- O registro pode ser consultado novamente na mesma tela.
- A categoria passa a servir de base para o cadastro de produtos.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| O botão **Salvar** não grava | Verifique se o campo **Nome** foi preenchido. |
| A tela não abre | Confirme acesso ao menu **Cadastros > Estoque > Categorias**. |
| Não consigo navegar entre registros | Pode não haver registros suficientes ou o usuário pode estar em modo de inclusão. |

## Observações

- A tela observada no demo abriu dentro do *frame* legado.
- No estado inicial observado, a tela mostrava um registro existente com o nome **INSTALAÇÃO**.
- A captura limpa confirmou a toolbar com navegação, inclusão, edição, exclusão, gravação, cancelamento e pesquisa.
- Ao iniciar um novo cadastro, o campo **Nome** aparece em branco e os botões de gravação/cancelamento ficam ativos.
- Esta página complementa o cadastro de **Produtos**, que depende dessa base de classificação.

## Dúvidas para revisão

- A categoria precisa de algum campo além de **Nome** em outros perfis ou versões?
- O botão **Procurar** abre uma lista de categorias ou uma busca textual simples?
- Existe alguma validação de duplicidade no nome da categoria?

## Screenshots sugeridos

- Tela **Categorias** no demo: `assets/screenshots/cadastros/estoque/categorias.png`
