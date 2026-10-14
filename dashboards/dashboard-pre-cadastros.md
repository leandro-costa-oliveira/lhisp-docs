---
title: Dashboard de Pré-cadastros
published: true
editor: markdown
description: Acompanhe leads cadastrados no período e a classificação comercial atual por estágio, segmento e vendedor.
---

# Dashboard de Pré-cadastros

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A tela `/marketing/dashboard/pre_cadastros` consolida **registros de pré-cadastro**. O período filtra a criação do lead, do início às 00:00:00 ao fim às 23:59:59. Começa no mês atual; mudar o intervalo atualiza a consulta.

Abra com sessão e acesso ao dashboard e aos pré-cadastros. A API limita os registros à empresa e ao escopo de filiais do usuário; pré-cadastros sem filial podem permanecer visíveis para serem atribuídos.

## Indicadores

| Indicador | Cálculo |
|---|---|
| **Total de leads** | Quantidade de pré-cadastros criados no período e não excluídos logicamente. |
| **Convertidos** | Registros desse conjunto cuja situação atual é Confirmado. |
| **Conversão** | Confirmados / total × 100; sem registros, zero. |
| **Em negociação** | Total − confirmados. Inclui também cancelados; não corresponde somente a oportunidades pendentes. |

Confirmar duas oportunidades do mesmo titular não as transforma em um lead único: o agrupamento é por registros, não CPF/CNPJ ou contratos distintos.

## Gráficos

O **Funil por estágio** distribui os registros pelos estágios atuais. **B2B vs B2C** usa o segmento, com grupo **Não informado** quando ausente. **Leads por vendedor** usa o vendedor atual e apresenta **Sem vendedor** quando não existe associação.

A **Evolução no período** agrupa a criação por dia. Dias sem registros não são necessariamente apresentados como pontos de valor zero.

As seis consultas do dashboard são feitas separadamente. Alterações simultâneas na carteira podem gerar diferenças transitórias entre cartões e agrupamentos; atualize a página antes de fechar um levantamento.

## Interpretação e saída

O painel mostra o estado atual dos leads criados na janela. Uma confirmação posterior pode aumentar a conversão de um período antigo. O estágio comercial e a situação de confirmação são campos diferentes e podem distribuir os mesmos leads de modos distintos.

Não há filtro por vendedor/segmento/estágio nem botão próprio de CSV ou impressão nessa tela. Para localizar e atualizar as oportunidades, use [Pré-cadastros](/cadastros/pre-cadastros). Para serviços já contratados e instalação, use [Dashboard Comercial](/dashboards/dashboard-comercial).
