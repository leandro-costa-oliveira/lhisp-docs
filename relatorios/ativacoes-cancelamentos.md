---
title: Ativações / Cancelamentos
published: true
editor: markdown
description: Analise eventos históricos dos serviços, separando ativações, reativações, cancelamentos e desativações.
---

# Ativações / Cancelamentos

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A tela `/relatorios/ativacoes_cancelamentos` consulta o **histórico de situação dos serviços contratados**. Cada linha é um evento histórico; um serviço pode aparecer mais de uma vez e um contrato pode ter vários serviços. Os totais não representam clientes únicos.

## Filtros

| Campo | Critério |
|---|---|
| **Período** | Data/hora do evento, do início às 00:00:00 ao fim às 23:59:59. O padrão é o mês atual. |
| **Filial** | Filial atual do contrato, respeitando as filiais acessíveis ao usuário. |
| **Vendedor** | Vendedor atualmente associado ao serviço contratado. |
| **Tipos**, em **Mais filtros** | Ativações, reativações, cancelamentos e desativações; todos começam selecionados. Sem tipos selecionados, não há eventos na saída. |
| **Origem do cliente** | Origem cadastrada atualmente no contrato. |
| **Motivo de cancelamento** | Motivo gravado no evento de cancelamento. Não exclui eventos de ativação/reativação/desativação ainda selecionados. |
| **Listar Clientes VIP** | Inclui eventos de serviços cujo valor atual não é positivo; começa desmarcado. |

Abra a tela com sessão e acesso ao menu, preencha o período e clique em **Exibir**. Mudanças no formulário só chegam ao resultado após aplicar os filtros. **Imprimir** usa os filtros e registros já aplicados, incluindo resumo e tabela. Não há CSV próprio nessa tela.

## Classificação dos movimentos

Eventos **Ativo** com marca de reativação formam **Reativações**; os demais eventos Ativo formam **Ativações**. Eventos **Cancelado** são separados em manuais e automáticos pelo indicador gravado no histórico. **Desativado** forma um grupo separado.

A grade apresenta contrato, filial, cliente, endereço, telefones, ID/plano do serviço, valor, data/hora, situação e motivo/descrição do evento.

## Resumo e valores

- **Saldo no período:** ativações + reativações − cancelamentos manuais − cancelamentos automáticos. Desativações não entram nesse saldo de quantidades.
- **Faturamento ativo:** soma dos valores das linhas de ativações e reativações.
- **Faturamento cancelado/desativado:** soma dos valores das linhas de cancelamento e desativação.
- **Saldo de faturamento:** diferença dessas duas somas.

O gráfico por filial soma ativações com reativações e separa cancelamentos manuais e automáticos. Não representa as desativações nesse gráfico.

Os valores vêm do **serviço atual**, não de uma fotografia do preço na data do evento, e não são recebimentos financeiros. Vários eventos do mesmo serviço repetem seu valor nas somas. Filial, vendedor, plano e origem também são relacionamentos atuais; uma mudança posterior pode alterar a classificação da consulta histórica.

A consulta exclui contratos e filiais apagados. Para contar contratos distintos com cancelamento efetivo e conferir cobertura histórica, use [Radar de Clientes](/dashboards/radar-de-clientes). Para a carteira atualmente cancelada, consulte [Clientes Cancelados](/relatorios/clientes-cancelados).
