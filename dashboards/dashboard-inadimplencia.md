---
title: Dashboard de Inadimplência
published: true
editor: markdown
description: Consulte contratos e valores em aberto por filial, com critérios de atraso e limites da data de referência.
---

# Dashboard de Inadimplência

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A tela `/dashboard/inadimplencia`, intitulada **Contas a Receber e Inadimplência**, reúne base de contratos, inadimplência, comparação por filial, evolução e faixas de atraso. Os indicadores contam **contratos distintos**, não pessoas; um titular com vários contratos pode contar mais de uma vez.

## Filtros

| Campo | Aplicação |
|---|---|
| **Data de referência** | Limita cadastro do contrato e vencimento das contas consideradas; começa em hoje. A interface não aceita data futura. |
| **Filial** | Filial do contrato; usuários não administradores permanecem limitados às filiais vinculadas ao seu acesso. |
| **Atraso mínimo** | A tela oferece 1, 5, 10, 15 ou 30 dias. |
| **Tipo de conta** | Restringe o tipo da conta a receber; vazio inclui todos. |
| **Incluir clientes VIP** | Começa desmarcado. Exclui, por padrão, contratos com serviço vigente de valor zero e sem serviço vigente de valor positivo. Contratos mistos pagos/gratuitos podem aparecer sem marcar a opção. |

Abra com sessão e acesso ao menu, preencha os campos e clique em **Atualizar**. A exportação utiliza os filtros já aplicados, não mudanças ainda pendentes no formulário.

## Cartões e comparação por filial

A base considera contratos **atualmente ativos e não apagados**, cadastrados até a referência. O contrato fica inadimplente se tiver ao menos uma conta atualmente aberta, não apagada, vencendo até a referência e que satisfaça o atraso mínimo.

**Percentual de inadimplência** é contratos inadimplentes divididos pela base. O **valor em aberto** soma, para esses contratos, todas as contas abertas do tipo escolhido com vencimento até a referência; pode incluir títulos que não alcançam individualmente o atraso mínimo.

O valor é calculado como nominal menos pagamento parcial e desconto, limitado ao mínimo zero. Desconto fixo e percentual são tratados conforme o tipo gravado. Não são acrescentados juros/multa nem usada a prorrogação para medir atraso nesse cálculo.

## Limite da data de referência

Nos cartões, CSV e seleção das faixas, o atraso mínimo é medido contra a **data atual do banco**, mesmo quando a referência escolhida é passada. As contas também precisam estar abertas **hoje**. Portanto, escolher um mês antigo não reconstrói a carteira que estava inadimplente naquele mês.

Exemplo: uma conta com vencimento anterior à referência, paga depois dela, não entra nos cartões atuais por estar paga hoje. Uma conta que não tinha cinco dias de atraso na referência pode entrar agora por já ter alcançado esse atraso hoje.

A **evolução de seis períodos** usa critérios próprios de geração, pagamento, cancelamento e exclusão da conta nas datas históricas. A base de contratos, os relacionamentos e as condições VIP continuam atuais. Os cinco primeiros pontos usam o último dia de cada mês e o último usa a referência selecionada. Esse gráfico pode divergir dos cartões sem indicar uma falha de soma.

As faixas **1–30**, **31–60**, **61–90** e **mais de 90 dias** agrupam os títulos individualmente pela diferença entre vencimento e referência. Um contrato com títulos em várias faixas aparece em mais de uma; não some suas quantidades para obter clientes únicos. O total monetário das faixas também pode divergir dos cartões, que incluem outros títulos do contrato inadimplente.

## CSV

**Baixar clientes (.csv)** produz uma linha por contrato: filial, contrato, cliente, quantidade de títulos com atraso mínimo, primeiro vencimento desses títulos, dias de atraso e valor em aberto do conjunto considerado. A exportação faz uma nova consulta com os filtros aplicados.

Use o painel para análise conforme esses critérios. Para cobrança operacional com prorrogação e regras de dias da empresa, confira [Clientes para Cobrança](/relatorios/clientes-para-cobranca). Para comparar a base, veja [Relatório de Clientes](/relatorios/relatorio-de-clientes).
