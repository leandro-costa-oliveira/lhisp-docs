---
title: Movimentação de estoque por filial
published: true
editor: markdown
description: Estado verificado da tela de movimentação por filial e alternativas de conferência.
---

# Movimentação de estoque por filial

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A tela **Relatório de Movimentação de Estoque por Filial** pode apresentar erros de consulta ou dados incompletos. Não use sua saída isoladamente para apurar o estoque por filial; confira os movimentos pelos históricos dos almoxarifados.

## Controles e saída previstos na interface

A tela solicita **Filial** e período, inicialmente o mês corrente. A consulta é habilitada somente com filial selecionada. Oferece **Exportar CSV** e **Imprimir**.

A tabela e o CSV previstos contêm data/hora, contrato, cliente, produto, quantidade, preço e total. O total por linha é quantidade × preço atual do produto, e o rodapé soma quantidades e valores. O nome-base do arquivo é `EstoquePorFilial`.

## Conferência do resultado

Mensagem de erro, campos vazios ou ausência de linhas não devem ser tratados como estoque zero. Confira os movimentos no histórico do almoxarifado e encaminhe divergências ao suporte antes de ajustar saldos.

## Alternativas disponíveis

Para saldo atual de um almoxarifado, use [Relatório de Estoque](/relatorios/relatorio-de-estoque). Para movimentos, use [Movimentações de Produtos](/relatorios/movimentacoes-de-produtos) ou o histórico do produto em `/almoxarifados/<AlmoxarifadoId>/<ProdutoId>/historico`.

Essas alternativas filtram almoxarifado/produto, não substituem automaticamente a consolidação por filial. Registre os almoxarifados e vínculos considerados ao fazer uma conferência manual.
