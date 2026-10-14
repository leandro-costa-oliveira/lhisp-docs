---
title: Movimentações Financeiras por Usuário
published: true
editor: markdown
description: Use o relatório legado para conferir movimentações de caixa e históricos de contas por operador; conheça o limite da tela SPA.
---

# Movimentações Financeiras por Usuário

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A consulta operacional está no **legado**, em `/lgc/relatorios|movimento_financeiro_usuario`. A tela SPA com o mesmo nome possui seletores e impressão, mas **Atualizar ainda não executa consulta e não há tabela de resultados** na implementação revisada. Uma tela vazia na SPA não comprova ausência de movimentações.

## Consultar no legado

1. Abra o relatório legado e escolha o **Usuário**.
2. Selecione **Filial**, quando desejar restringir os vínculos dos títulos.
3. Informe as datas inicial e final.
4. Em **Exibir**, escolha **Movimentações / Contas**, somente **Movimentações** ou somente **Contas**.
5. Clique em **Exibir**, confira os dois conjuntos separadamente e use **Imprimir**.

Usuários com administração de filial podem escolher operador e período. Para os demais, o processamento força **o próprio usuário e a data de hoje**, mesmo que outros valores sejam enviados. A seleção de caixas segue os acessos da sessão.

## Dois conjuntos com datas diferentes

| Conjunto | Critério de seleção e conteúdo |
|---|---|
| **Movimentações** | Operador que criou o movimento e sua data/hora de registro dentro do período. Mostra caixa, data do caixa, descrição e valor, com contas recebidas/pagas e observações associadas. |
| **Contas** | Eventos do histórico de contas a receber registrados pelo usuário no período. Mostra filial, contrato, cliente, descrição, vencimento, documento e valor do evento. |

O intervalo vai de 00:00:00 do primeiro dia a 23:59:59 do último. **Data do Caixa** é exibida, mas a seleção de movimentos por usuário usa a data/hora de registro. Um lançamento hoje para um caixa de ontem entra na consulta de hoje.

O filtro Filial das movimentações considera a filial das contas associadas. Movimentos sem vínculo com conta a receber ou pagar continuam incluídos; uma linha manual não é necessariamente atribuível à filial escolhida.

## Totais e auditoria

- O rodapé **Faturamento** das movimentações soma os valores das linhas sem subtrair saídas. Não representa lucro, receita de vendas ou saldo do caixa.
- O total de **Contas** soma o valor positivo registrado no histórico; se não houver, usa o valor nominal do título. Pode contar várias alterações da mesma conta e inclui eventos que não são recebimento.
- Os dois totais usam conjuntos diferentes e podem conter fatos relacionados. Não os some para calcular receita.
- A quantidade de Contas é quantidade de eventos históricos, não títulos ou clientes distintos.

Para saldo e entradas/saídas efetivas, confira [Fluxo de Caixa](/relatorios/fluxo-de-caixa) ou o controle diário na [Gerência Financeira](/financeiro/gerencia-financeira). Para explicar um evento, abra a conta e seu histórico completo.

O formulário legado possui impressão e não oferece CSV próprio. Prefira consultar primeiro períodos curtos, especialmente na visão que exibe movimentos e históricos juntos.
