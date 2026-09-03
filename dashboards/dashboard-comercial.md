---
title: Dashboard Comercial
published: true
editor: markdown
description: ''
---

# Dashboard Comercial

## Objetivo

Acompanhar os serviços contratados no período, o andamento de suas instalações e a distribuição por plano, filial e atendente.

## Quando usar

Use o dashboard para analisar cadastros comerciais, identificar serviços sem ordem de instalação, acompanhar instalações pendentes ou concluídas e exportar os registros da consulta.

## Pré-requisitos

- Estar autenticado no LHISP.
- Ter acesso ao menu **Dashboard Comercial**.
- Ter acesso às filiais e aos dados comerciais consultados.

## Filtros

| Campo | Comportamento |
|---|---|
| **Período** | Intervalo inclusivo da data de cadastro do serviço contratado. Inicia no primeiro e no último dia do mês atual. As duas datas são obrigatórias e a inicial não pode ser posterior à final. |
| **Filial** | Restringe os serviços aos contratos da filial escolhida. Vazio consulta todas as filiais permitidas ao usuário. |
| **Atendente** | Restringe os serviços pelo usuário associado ao cadastro. Vazio consulta todos os atendentes. |
| **Atualizar** | Aplica os filtros preenchidos. Alterar um campo sem clicar neste botão não muda os indicadores. |

## Indicadores

| Indicador | Regra aplicada |
|---|---|
| **Cadastros no período** | Quantidade de serviços contratados criados no intervalo, não a quantidade de pessoas ou contratos novos. |
| **Instalações concluídas** | Serviços cuja primeira ordem de serviço do tipo instalação está concluída. O cartão também apresenta a proporção sobre os cadastros do período. |
| **Aguardando instalação** | Serviços que possuem ordem de instalação, mas cuja primeira ordem ainda não está concluída. |
| **Cadastros sem OS** | Cadastros menos instalações concluídas e instalações em espera, limitado ao mínimo de zero. |
| **Cadastros por plano e atendente** | Distribuição dos serviços por plano, separada por atendente, com destaque para o plano de maior total. |
| **Cadastros por filial** | Distribuição dos serviços pela filial do contrato. |
| **Cadastros por atendente** | Quantidade de serviços vinculados a cada atendente, com destaque para o maior valor. |
| **Vendas instaladas por atendente** | Instalações concluídas agrupadas pelo atendente associado ao serviço. |

Quando plano, filial ou atendente não está associado ao registro, o agrupamento usa respectivamente **SEM PLANO**, **SEM FILIAL** ou **SEM VENDEDOR**.

## Passo a passo

1. Acesse **Dashboard Comercial**.
2. Informe o período desejado.
3. Se necessário, selecione uma filial e/ou um atendente.
4. Clique em **Atualizar**.
5. Consulte os cartões e gráficos.
6. Para obter os registros da consulta, clique em **Baixar cadastros (.csv)**.

## Exportação CSV

O arquivo usa os mesmos filtros já aplicados ao painel e contém:

- ID do serviço;
- filial;
- contrato;
- cliente;
- plano;
- atendente;
- data do cadastro;
- situação do serviço;
- situação da instalação (**SEM OS**, **INSTALADA** ou **AGUARDANDO INSTALAÇÃO**);
- valor do serviço.

O botão de exportação fica indisponível enquanto há consulta/exportação em andamento ou quando o total de cadastros é zero.

## Resultado esperado

Os indicadores e gráficos são recalculados com os filtros aplicados. Em caso de falha, a tela exibe **Não foi possível carregar a dashboard** com a mensagem devolvida pela API.

## Observações

- A consulta considera a data de criação do **serviço contratado**.
- A situação da instalação é determinada pela primeira ordem de serviço de instalação retornada para o serviço.
- O dashboard consulta `POST /api/Relatorios.DashboardComercial`; a exportação usa `POST /api/Relatorios.DashboardComercialCadastros`.

## Captura de tela

![Dashboard Comercial](/assets/screenshots/dashboards/dashboard-comercial.png)

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.
