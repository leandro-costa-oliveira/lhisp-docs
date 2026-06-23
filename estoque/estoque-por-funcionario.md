---
title: Estoque por Funcionário
published: true
editor: markdown
description: ''
---

# Estoque por Funcionário

> **⚠️ Rascunho gerado por agente**
>
> Esta página foi documentada a partir da tela equivalente no ambiente de demonstração do LHISP. A captura usada veio do demo e foi mantida sem marcações visuais.

## Objetivo

Consultar e administrar o estoque associado a um funcionário, com filtros por funcionário e categoria e ações de atualização, histórico, devolução e impressão.

## Quando usar

Use esta tela quando precisar:

- verificar os itens vinculados a um funcionário;
- filtrar por categoria;
- atualizar os dados exibidos;
- consultar o histórico;
- registrar devoluções;
- imprimir o resumo do estoque.

## Pré-requisitos

- Estar autenticado no LHISP.
- Ter permissão para acessar o fluxo **Estoque do Funcionário**.
- Saber qual funcionário será consultado.

## Passo a passo

1. Acesse **Estoque > Estoque por Funcionário**.
2. Selecione o **Funcionário** desejado.
3. Marque ou desmarque a opção de exibição por **Categoria** conforme necessário.
4. Selecione a **Categoria** quando for preciso restringir o resultado.
5. Clique em **Atualizar** para carregar os itens do estoque.
6. Use **Histórico**, **Devolução** ou **Imprimir** conforme a necessidade operacional.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| **Funcionário** | Seleciona o colaborador cujo estoque será consultado. |
| **Categoria** | Filtra os produtos por categoria. |
| **Exibir Somente Produtos da iCategoria Selecionada !** | Controla se a listagem ficará limitada à categoria marcada. |
| **Produto** | Campo exibido na tela para o item do estoque. |
| **Atualizar** | Recarrega a visualização do estoque do funcionário. |
| **Histórico** | Abre o histórico de movimentações. |
| **Devolução** | Inicia a devolução de itens. |
| **Imprimir** | Gera a impressão do conteúdo exibido. |

## Resultado esperado

- A tela mostra os filtros do funcionário e da categoria.
- Os botões operacionais ficam disponíveis para consulta e impressão.
- A área inferior é preenchida quando houver itens retornados pela consulta.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| O botão **Atualizar** fica indisponível | Verifique se o funcionário foi selecionado corretamente. |
| Não aparecem itens | Confirme se a categoria e a opção de exibição estão coerentes. |
| O histórico não abre | Revise a permissão do perfil. |

## Observações

- A rota observada no demo foi `/estoque/por_funcionario`.
- A captura limpa mostra um formulário com seleção de funcionário, categoria e ações no topo.
- A área de resultados estava vazia no momento da captura.
- A tela é operacional normal, sem iframe legado.

## Dúvidas para revisão

- A opção **Exibir Somente Produtos da iCategoria Selecionada !** é obrigatória em algum cenário?
- O botão **Histórico** depende de seleção prévia do funcionário?
- O campo **Produto** pode ser editado ou é apenas informativo?

## Screenshots sugeridos

- Tela **Estoque por Funcionário** no demo: `assets/screenshots/estoque/estoque-por-funcionario.png`

![Estoque por Funcionário no demo](/assets/screenshots/estoque/estoque-por-funcionario.png)
