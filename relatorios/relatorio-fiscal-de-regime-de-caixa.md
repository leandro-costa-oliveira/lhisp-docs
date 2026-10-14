---
title: Relatório Fiscal de Regime de Caixa
published: true
editor: markdown
description: Compare notas normais da competência com notas vinculadas a contas pagas no mês e conheça os limites dos totais.
---

# Relatório Fiscal de Regime de Caixa

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O relatório aproxima emissão fiscal e recebimento por dois recortes diferentes: **notas da competência selecionada** e **notas vinculadas a contas pagas no mês selecionado**. Não calcula tributos nem efetua transmissão ou baixa financeira.

## Usar a tela

1. Abra **Relatórios > Relatório Fiscal por Regime de Caixa**.
2. Selecione **Filial**, **Mês**, **Ano** e um **Tipo** específico de nota.
3. Aguarde os cartões **Emitidas no Mês**, **Pagas no Mês** e a tabela de notas pagas.
4. Use **Imprimir** para imprimir o resultado.

O mês e ano iniciais são os atuais. Os filtros atualizam as consultas; não há botão Exibir nem CSV próprio. O backend exige acesso à leitura de notas fiscais e limita as filiais conforme a sessão.

**Limitação do seletor Tipo:** a opção **Todas** é convertida para o código `0`, que é enviado como filtro, em vez de omitir o tipo. Isso pode resultar em pesquisa vazia. Para conferência, consulte cada tipo explicitamente até esse comportamento ser corrigido.

## Comparar os cartões

| Quadro | Seleção e total |
|---|---|
| **Emitidas no Mês** | Notas na situação Normal, com mês/ano de competência iguais aos filtros. Quantidade de notas e soma do campo Valor. Não filtra diretamente a data de emissão. |
| **Pagas no Mês** | Notas normais com conta a receber vinculada na situação Paga e data de pagamento dentro do mês. A competência da nota pode ser anterior ou posterior. |
| **Tabela Notas Fiscais** | Mesmo recorte das pagas, ordenado por número de série, com referência, valor, tipo, documento e pagamento. |

Diferença entre emitidas e pagas não é, sozinha, uma inconsistência: uma nota de setembro recebida em outubro pertence ao cartão de emissão de setembro e ao de pagamento de outubro.

## O que o valor representa

O quadro **Pagas** soma o **valor da nota**, não o valor pago, tarifa, movimentação de caixa ou parcela recebida no período. Um recebimento parcial que mantém a conta aberta fica fora. Uma baixa sem recebimento pode entrar se a conta estiver marcada como paga e possuir data no mês.

O cálculo não soma automaticamente os campos fiscais SCM, SVA e locação para substituir o campo Valor. Portanto, não trate este total como base tributária definitiva para todos os tipos de nota. Confira a composição do documento e o processo contábil aplicável.

Notas canceladas, substituídas ou excluídas logicamente ficam fora do recorte normal. Uma nota sem conta a receber vinculada pode entrar em Emitidas, mas não em Pagas.

## Conferir linhas e diferenças

A tabela mostra contrato, cliente, número de série, emissão, referência, valor, tipo, fatura e pagamento. A coluna Cliente pode apresentar `----` mesmo havendo pessoa na nota, pois a renderização espera o vínculo de pessoa dentro do contrato. Confira o destinatário na própria nota.

A consulta não possui paginação na tela. Para meses extensos, restrinja filial e tipo antes de imprimir. Se uma nota paga não aparecer, confira situação normal, tipo, vínculo com a conta, situação paga e data de pagamento; apenas haver movimento financeiro não atende a todos esses critérios.

Use [Notas fiscais](/financeiro/notas-fiscais) para detalhes do documento e [Contas a Receber](/relatorios/contas-a-receber) para conferir recebimentos. O relatório não substitui a conciliação entre valores fiscais, financeiros e caixa.
