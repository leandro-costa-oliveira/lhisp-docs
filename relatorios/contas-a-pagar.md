---
title: Contas a Pagar
published: true
editor: markdown
description: Analise valores nominais de contas a pagar por categoria e centro de custo, com detalhamento e filtros de criação ou vencimento.
---

# Contas a Pagar

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O relatório organiza obrigações por **categoria financeira** e **centro de custo**, com quantidade, valor nominal e participação percentual. A tela não filtra a situação: contas abertas, pagas e canceladas podem participar do mesmo total. Para consultar somente obrigações ainda devidas ou efetuar pagamento, use a [Gerência Financeira](/financeiro/gerencia-financeira).

## Definir a análise

1. Abra **Relatórios > Financeiro > Contas a Pagar**.
2. Selecione uma ou mais **Filiais**; sem seleção, a consulta considera o escopo disponível ao usuário.
3. Informe as datas e escolha **Vencimento** ou **Criação**.
4. Mantenha **Categorias**, **Centros de Custo** ou ambos marcados.
5. Marque **Visão Analítica** para abrir os títulos dentro dos grupos.
6. Aguarde as consultas e clique em **Imprimir**.

O período inicial é o mês corrente. As mudanças de filtro atualizam as consultas; a tela não possui uma etapa separada de Exibir nem exportação CSV própria. O acesso aos dados usa a permissão de leitura do cadastro de contas a pagar, além das filiais permitidas.

## Valores e agrupamentos

| Resultado | Regra |
|---|---|
| **Quantidade** | Número de contas no grupo, não fornecedores ou pagamentos. |
| **Total** | Soma do campo Valor dos títulos, sem descontar o valor já pago. |
| **Percentual da categoria/centro** | Total do grupo dividido pelo total geral, arredondado para inteiro. |
| **Percentual do item** | Total do subitem dividido pelo total de sua categoria/centro. |
| **SEM Categoria / SEM Centro de Custo / SEM ITEM** | Registros sem o respectivo vínculo cadastral. |

Categoria e centro de custo são duas formas de distribuir as mesmas contas; não some os dois quadros como se fossem despesas diferentes. Se o total for zero, a participação percentual pode não produzir um valor útil.

A **Visão Analítica** mostra filial, fornecedor, descrição, vencimento, pagamento, valor, valor pago e situação. Um título pode aparecer nos dois quadros quando ambos estiverem habilitados. Contas excluídas logicamente são omitidas pela consulta padrão.

## Datas e limites

- **Vencimento** seleciona obrigações pela data de vencimento, independentemente de quando foram pagas.
- **Criação** seleciona pelo registro da conta, não pela compra ou pagamento.
- Na implementação atual, o quadro por categoria envia as datas de criação sem hora; centro de custo e analítico enviam horários de início/fim do dia. A categoria pode deixar de incluir registros criados durante o último dia, fazendo os quadros divergirem. Confira esse dia na gerência antes de fechar a análise.
- Os quadros compartilham um total geral na tela. Se as consultas divergirem, os percentuais também precisam de conferência.
- A consulta analítica não é paginada na interface. Prefira períodos menores para detalhamentos extensos.

Para conferir saída efetiva de dinheiro, consulte [Fluxo de Caixa](/relatorios/fluxo-de-caixa). O valor nominal deste relatório não representa o saldo aberto nem a despesa efetivamente paga no período.
