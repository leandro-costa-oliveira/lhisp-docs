---
title: Categorias de estoque
published: true
editor: markdown
description: Classifique produtos e permita solicitações ou ordens de separação por grupo de material.
---

# Categorias de estoque

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A categoria agrupa produtos do estoque por finalidade ou natureza, como instalação, equipamentos, cabos ou material de escritório. Ela facilita filtros e também permite solicitar/separar material por categoria quando o item exato ainda não foi definido.

Não confunda com **Categoria Financeira**, usada em contas a pagar. Esta categoria pertence ao estoque e é obrigatória no cadastro de produto.

## Relações no fluxo de materiais

- Cada produto aponta para uma categoria.
- Solicitações de material podem guardar categoria e produto.
- Itens de ordens de separação podem ser criados por estoque, produto ou somente categoria.
- Quando o item parte de um registro de estoque, categoria e produto são copiados desse registro.
- A importação de NF-e de compra pode localizar/criar categorias para classificar os produtos recebidos.

Assim, nomes estáveis tornam solicitações, separações e relatórios mais compreensíveis. Evite categorias genéricas demais ou duplicadas por variação ortográfica.

## Cadastrar ou alterar

1. Acesse **Cadastros > Estoque > Categorias**.
2. Pesquise pelo nome antes de criar.
3. Clique em **Cadastrar/Novo**, informe um nome único e salve.
4. Ao renomear, confirme se o novo termo continua adequado a todos os produtos vinculados.

Nome é obrigatório e não pode duplicar outra categoria ativa. No fluxo legado, inclusão, alteração e exclusão verificam `categoria_add`, `categoria_edit` e `categoria_del`.

## Exclusão

A exclusão é lógica: a categoria deixa de aparecer nas consultas e seletores comuns, mas referências históricas permanecem. Produtos existentes podem continuar apontando para ela e ficar difíceis de manter em telas que listam apenas categorias ativas.

Antes de apagar:

1. liste os produtos vinculados;
2. verifique solicitações e ordens de separação abertas;
3. mova os produtos para outra categoria quando necessário;
4. só então remova o cadastro.

| Problema | Verificação |
|---|---|
| Nome duplicado | Reutilize a categoria existente ou padronize a nomenclatura. |
| Categoria não aparece no produto | Ela pode ter sido excluída logicamente. |
| Ordem pede apenas uma categoria | O separador deverá definir o produto/estoque adequado durante o atendimento do material. |
| Produto ficou sem categoria selecionável | Reclassifique-o antes de excluir o grupo antigo. |

![Categorias de estoque](/assets/screenshots/cadastros/estoque/categorias.png)

Veja também [Produtos](/cadastros/estoque/produtos) e [Material para Técnico](/estoque/material-para-tecnico).
