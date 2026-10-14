---
title: Movimentação de estoque por filial
published: true
editor: markdown
description: Estado verificado da tela de movimentação por filial e alternativas de conferência.
---

# Movimentação de estoque por filial

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A rota `/relatorios/estoque_por_filial` existe na interface e se apresenta como **Relatório de Movimentação de Estoque por Filial**. No checkout auditado, o contrato de consulta dessa tela não corresponde ao BI/modelo do backend; a saída ainda precisa de validação/correção antes de servir como apuração de estoque por filial.

## Controles e saída previstos na interface

A tela solicita **Filial** e período, inicialmente o mês corrente. A consulta é habilitada somente com filial selecionada. Oferece **Exportar CSV** e **Imprimir**.

A tabela e o CSV previstos contêm data/hora, contrato, cliente, produto, quantidade, preço e total. O total por linha é quantidade × preço atual do produto, e o rodapé soma quantidades e valores. O nome-base do arquivo é `EstoquePorFilial`.

## Incompatibilidade identificada nas fontes

O frontend chama `HistoricoEstoque.findAll` pedindo `dataLocacao`, `withContrato` e `withProduto`. Porém:

- o modelo `HistoricoEstoque` expõe a data como `createdAt`, mapeada para `HISTORICOESTOQUE.DATAHORA`;
- seus vínculos são com **Estoque** e **Locacao**, além de usuário e documentos;
- o BI não oferece `withContrato` ou `withProduto` diretos.

Esses vínculos precisam ser percorridos por estoque/locação, como já faz o histórico de almoxarifado. A presença de botões e colunas não comprova que a consulta retorna os dados previstos. Mensagem de erro, campos vazios ou ausência de linhas não devem ser tratados como estoque zero.

## Alternativas disponíveis

Para saldo atual de um almoxarifado, use [Relatório de Estoque](/relatorios/relatorio-de-estoque). Para movimentos, use [Movimentações de Produtos](/relatorios/movimentacoes-de-produtos) ou o histórico do produto em `/almoxarifados/<AlmoxarifadoId>/<ProdutoId>/historico`.

Essas alternativas filtram almoxarifado/produto, não substituem automaticamente a consolidação por filial. Registre os almoxarifados e vínculos considerados ao fazer uma conferência manual. Nenhum lançamento, recomposição de saldo ou teste contra banco real foi executado nesta revisão.

## Fontes conferidas

Comportamento confrontado com os checkouts locais em 14/10/2026. Não comprova a versão instalada nem execução com dados reais.

- `lhisp-frontend/src/paginas/relatorios/estoque_por_filial/RelEstoquePorFilial.tsx:36`
- `lhisp-frontend/src/paginas/relatorios/estoque_por_filial/CardListaEstoquePorFilial.tsx:5`
- `lhisp-backend/src/lhisp-business/src/models/estoque/HistoricoEstoque.js:29`
- `lhisp-backend/src/lhisp-business/src/business/estoque/HistoricoEstoqueBI.js:4`
- `lhisp-frontend/src/paginas/almoxarifados/HistoricoEstoque.tsx:39`
