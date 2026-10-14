---
title: Adimplência por vencimento
published: true
editor: markdown
description: Agrupe mensalidades pelo dia do vencimento e entenda as contagens de contratos, títulos e ticket médio.
---

# Adimplência por vencimento

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O relatório compara mensalidades que vencem no intervalo escolhido, agrupadas pelo **dia do mês**. Uma janela de vários meses reúne, por exemplo, todos os vencimentos de dia 10 na mesma linha. O período inicial é o mês corrente.

## Consulta e saída

1. Abra **Relatórios > Financeiro > Adimplência por vencimento**.
2. Informe o intervalo de **vencimentos**. Ele não limita a data em que o pagamento ocorreu.
3. Aguarde a consulta; **Atualizar** repete a busca com o período atual.
4. Confira o gráfico empilhado e a tabela antes de usar **Exportar CSV** ou **Imprimir**.

O relatório lê contas do tipo **Mensalidade**, dentro da empresa e das filiais acessíveis ao usuário. A tela não possui seletor de filial, banco ou situação. A leitura depende do acesso às contas a receber; conseguir abrir o menu sozinho não garante autorização da consulta.

## O que cada coluna conta

| Coluna | Regra aplicada |
|---|---|
| **Vencimento** | Dia do vencimento original; títulos sem data válida são ignorados na distribuição. |
| **Clientes** | Contratos distintos naquele dia, não pessoas distintas. Um contrato com vários títulos do mesmo dia conta uma vez. |
| **Pagamentos em dia** | Quantidade de títulos com data de pagamento igual ou anterior ao vencimento original. |
| **Pagamentos em atraso** | Quantidade de títulos com data de pagamento posterior ao vencimento original. |
| **Pagamentos em aberto** | Quantidade de títulos sem data de pagamento válida, mesmo se o vencimento ainda for futuro. |
| **Ticket médio** | Média de todos os títulos do grupo: usa valor pago quando positivo e, caso contrário, valor nominal. |
| **Atraso médio (dias)** | Média da diferença entre pagamento e vencimento somente entre os títulos classificados em atraso. |

O **ticket médio geral** usa todas as contas retornadas, com a mesma regra de valor. Não é média somente de recebimentos nem média por cliente. Exemplo: um título pago de R$ 100 e outro sem pagamento de R$ 200 produzem ticket de R$ 150.

## Limites de interpretação

- A consulta não restringe explicitamente a situação financeira. Cancelamento, negociação ou baixa com recebimento zero não são classificados pela situação: a distribuição usa a presença da data de pagamento.
- A comparação não ajusta prorrogação nem próximo dia útil. Pode divergir do filtro **Pagamento em dias/atrasados** do [relatório de contas a receber](/relatorios/contas-a-receber).
- Pagamentos contam títulos; **Clientes** conta contratos. Somar a coluna Clientes entre dias pode contar novamente o mesmo contrato.
- O gráfico mostra quantidades, não valores nem um percentual de adimplência.

O CSV exporta uma linha por dia agrupado, com as mesmas sete colunas da tabela. Não contém os títulos individuais. Para investigar um resultado, confira as contas e seus históricos na [Gerência Financeira](/financeiro/gerencia-financeira).
