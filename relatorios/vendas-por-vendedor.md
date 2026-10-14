---
title: Vendas por Vendedor
published: true
editor: markdown
description: Liste serviços pela ativação e pelo vendedor vinculado, com paginação e exportação CSV dos resultados.
---

# Vendas por Vendedor

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

Este relatório lista **serviços contratados ativados no período que possuem vendedor vinculado**. Cada linha é um serviço; não é uma soma de pedidos, pessoas distintas, vendas de produtos ou valores efetivamente recebidos.

## Filtrar a listagem

1. Abra **Relatórios > Vendas por Vendedor**.
2. No botão de filtros, informe **Data Inicial**, **Data Final** e, se desejar, **Vendedor**.
3. Para restringir por cliente, digite o começo do nome no campo de pesquisa e clique na lupa.
4. Navegue pelas páginas ou use **Baixar Planilha**.

O período inicia no mês corrente e usa a **data de ativação do serviço**, não a data de cadastro do cliente, do pedido ou do pagamento. Sem escolher vendedor, ainda são exigidos serviços com vínculo de vendedor válido. Não há filtro de situação do serviço nessa consulta: um serviço depois bloqueado ou cancelado pode continuar aparecendo pela ativação no período.

A pesquisa de cliente usa **prefixo do nome**. Um trecho no meio do nome não equivale à mesma busca. Os dados dependem da leitura de contratos e das filiais acessíveis à sessão; o formulário não possui seletor de filial próprio.

## Interpretar as colunas

| Coluna | Origem e limite |
|---|---|
| **Vendedor** | Pessoa vinculada como vendedor do serviço. |
| **Contrato / Cliente** | Contrato e pessoa associados ao serviço. Uma pessoa pode aparecer várias vezes. |
| **Plano** | Plano associado ao serviço no momento da consulta. |
| **Data de Ativação** | Data usada no filtro do relatório. |
| **Valor** | Valor cadastrado no serviço contratado; não é valor recebido, comissão ou total histórico da venda. |
| **Vencimento / Situação da Conta** | Uma conta a receber associada ao serviço, limitada a um registro. A consulta não define ordenação nem garante que seja a primeira mensalidade, a mais recente ou a conta do período. |

Quando não houver conta associada, as duas últimas colunas mostram `----`. Não conclua por esse campo isolado que o serviço está adimplente ou inadimplente: confira a [aba financeira do contrato](/contratos/gerar-contas-cliente).

## Paginação e arquivo

A tela mostra **10 serviços por página**. O contador considera os serviços que atendem aos filtros, não vendedores distintos. Alterar vendedor ou datas pode exigir voltar à primeira página se a página atual ficar vazia.

**Baixar Planilha** percorre as páginas do resultado e gera CSV com as colunas exibidas. Aguarde a barra de progresso; o arquivo não se limita às dez linhas visíveis. A tela não possui comando próprio de impressão, agrupamento por vendedor, ranking ou totalizador de comissão.

Se um serviço esperado não aparecer, confira data de ativação, vínculo do vendedor, nome pesquisado e acesso à filial. Para faturamento e recebimentos, use [Contas a Receber](/relatorios/contas-a-receber) ou [Projeções e Recebimentos](/relatorios/projecoes-e-recebimentos).
