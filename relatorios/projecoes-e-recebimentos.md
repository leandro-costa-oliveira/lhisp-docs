---
title: Projeções e Recebimentos
published: true
editor: markdown
description: Leia a visão anual de receitas, despesas, contratos e serviços, distinguindo valores consolidados e indicadores históricos.
---

# Projeções e Recebimentos

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A visão anual combina **valores financeiros consolidados por filial e mês** com indicadores de contratos e serviços calculados a partir dos históricos. Os doze meses são apresentados juntos; selecionar várias filiais soma os valores de cada mês.

## Consultar e exportar

1. Abra **Relatórios > Projeções e Recebimentos**.
2. Informe um ano inteiro entre **2000 e 2100**.
3. Selecione as **Filiais**, ou deixe em branco para considerar as filiais disponíveis à sessão.
4. Clique em **Atualizar** para aplicar os filtros.
5. Confira o resumo financeiro, a evolução dos contratos e os quadros detalhados de **Projeção financeira**, **Contratos** e **Serviços**.
6. Use **Imprimir** para a página ou **Baixar Planilha** no quadro correspondente para gerar seu CSV.

A consulta restringe a empresa e as filiais permitidas. O acesso usa o formulário de projeções e recebimentos; ausência de uma filial pode decorrer do escopo do usuário.

## Valores financeiros mensais

| Indicador | Regra da consolidação |
|---|---|
| **Receitas Previstas** | Soma do valor nominal das contas abertas ou pagas com vencimento no mês. Não é cálculo de novos títulos a partir de contratos futuros. |
| **Mensalidades / Serviços / Vendas / Instalações / Outros** | Recortes do previsto por tipo de conta. O total geral pode incluir tipos fora dessas cinco linhas. |
| **Receitas Recebidas** | Soma do valor pago de contas na situação paga, pela data de pagamento no mês, mesmo que o vencimento seja de outro mês. |
| **Antecipadas / No Vencimento / Em atraso** | Distribuição do recebido comparando a data de pagamento com o vencimento original. Não utiliza prorrogação ou calendário de dias úteis. |
| **Despesas** | Soma do valor nominal de contas a pagar com vencimento no mês, sem filtro de situação. Não é o valor efetivamente pago. |
| **Saldo Previsto** | Receitas previstas menos despesas nominais do mês. |
| **Saldo Efetivo** | Receitas recebidas menos essas mesmas despesas nominais. Não representa o saldo dos caixas. |

Pagamentos parciais que continuam com situação aberta não entram em Receitas Recebidas. Descontos e cancelamentos podem fazer o previsto divergir de outros relatórios: esta consolidação usa os campos e situações acima.

No resumo, **Receita prevista anual** e **Saldo projetado** usam o ano inteiro. **Receita recebida** acumula somente meses já iniciados. A **realização da receita** divide recebido por previsto somente nos meses encerrados; o mês corrente fica fora dessa razão. Meses futuros não recebem barras de receita realizada no gráfico.

## Contratos, serviços e churn

Os quadros separam contratos e serviços contratados. Uma pessoa pode ter mais de um contrato, e um contrato pode ter vários serviços.

- **Início do mês:** entidades cuja última situação relevante anterior ao mês era ativa.
- **Adições, Cancelamentos e Suspensões:** transições de situação no mês; históricos repetidos sem mudança de situação não somam outra transição.
- **Balanço mensal:** adições menos cancelamentos e suspensões.
- **Fim do mês:** início mais balanço.
- **Taxa de crescimento:** balanço dividido pela base inicial, em percentual.
- **Churn mensal:** cancelamentos mais suspensões, divididos pela base inicial. Com base zero, a tabela mostra zero.

O resumo de **Churn acumulado** usa a soma das saídas dividida pela soma das bases mensais dos meses já iniciados. Isso difere da média de percentuais apresentada no quadro mensal. Adições podem incluir reativações, e a mesma entidade pode gerar mais de uma transição no período.

Quando não existe histórico relevante, a apuração usa cadastros antigos como alternativa para a base inicial, considerando situação e data disponíveis. Importações sem histórico e transferências de filial exigem conferência; o relatório não reconstrói fatos que não foram registrados.

## Atualização e conferência

**Atualizar na tela não executa a consolidação financeira.** A busca normal lê os valores financeiros já persistidos e recalcula os indicadores históricos. A rotina de consolidação existe separadamente; sua execução e periodicidade no ambiente precisam ser conferidas pela operação.

O rótulo **Última consolidação** mostrado no cabeçalho usa o horário em que a resposta foi obtida pelo navegador. Não comprova quando os valores financeiros foram consolidados no servidor. Um mês sem consolidação pode aparecer com zeros mesmo possuindo títulos.

Para investigar divergências, mantenha ano e filiais iguais e confronte [Contas a Receber](/relatorios/contas-a-receber), [Contas a Pagar](/relatorios/contas-a-pagar) e os históricos dos contratos. Para dinheiro efetivamente movimentado, use [Fluxo de Caixa](/relatorios/fluxo-de-caixa).
