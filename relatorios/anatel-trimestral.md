---
title: Anatel - Trimestral
published: true
editor: markdown
description: Apuração de Capex, impostos e receita fiscal por trimestre, com limites do cálculo.
---

# Anatel - Trimestral

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A tela `/relatorios/anatel_trimestral` reúne quatro indicadores financeiros: **Investimentos (Capex)**, **Impostos**, **Receita Operacional Bruta** e **Receita Operacional Líquida (ROL)**. Ela apoia a conferência; não gera protocolo nem transmite uma declaração à Anatel.

## Selecionar a base do cálculo

1. Escolha **Ano** e **Trimestre**; o padrão é o primeiro trimestre do ano corrente.
2. Informe o **Centro de Custo de Investimento** e o **Centro de Custo de Impostos**.
3. Aguarde as consultas. Sem centro selecionado, a respectiva consulta de despesas não é executada.
4. Ative **Exibir Detalhamento** para visualizar os grupos retornados.
5. Confira os valores e use **Imprimir**.

| Indicador | Origem e regra |
|---|---|
| Capex | Soma de `ContaPagar.valor` no centro de investimento, agrupada pelo mês/ano de `PAGAMENTO`. |
| Impostos | Mesma regra, usando o centro de impostos. |
| Receita bruta | Soma de `NotaFiscal.valor`, situação **NORMAL**, por ano/mês de referência e tipo de nota. |
| ROL | Receita bruta menos impostos. Capex não é subtraído nessa fórmula. |

Trimestres correspondem a janeiro–março, abril–junho, julho–setembro e outubro–dezembro. Os valores são apresentados em reais. Despesas usam a data de pagamento; receita usa a referência fiscal, portanto as duas partes não têm a mesma base temporal.

## Conferências necessárias

A consulta de despesas não acrescenta um filtro explícito de situação paga: utiliza o mês/ano de `PAGAMENTO`. Confira lançamentos com essa data preenchida e os centros escolhidos. Um centro contendo despesas de naturezas diferentes altera o indicador inteiro.

O detalhamento rotula linhas pela posição no retorno, enquanto as consultas podem retornar meses ausentes ou vários tipos de nota no mesmo mês. Confira mês, tipo e soma nos relatórios financeiros/fiscais de origem antes de usar as legendas como detalhamento mensal certificado.

O código de **Tráfego Médio da Rede** e a opção **Somente Fiscal** estão comentados nesta tela; não fazem parte da saída atual. Não há exportação ou transmissão regulatória implementada neste formulário.

## Fontes conferidas

Comportamento confrontado com os checkouts locais em 14/10/2026. Não comprova a versão instalada nem execução com dados reais.

- `lhisp-frontend/src/paginas/relatorios/anatel/trimestral/RelAnatelTrimestral.tsx:20`
- `lhisp-frontend/src/api/queries/financeiro/useSumContasPagarMesAno.ts:18`
- `lhisp-frontend/src/api/queries/financeiro/useSumNotasFiscaisMesAno.ts:25`
- `lhisp-frontend/src/paginas/relatorios/anatel/trimestral/RenderAnatelTrimestralDet.tsx:24`
