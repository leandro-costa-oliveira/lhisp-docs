---
title: Gerar contas a receber do contrato
published: true
editor: markdown
description: Lance cobranças avulsas, entenda o parcelamento e acompanhe seus efeitos bancários e fiscais.
---

# Gerar contas a receber do contrato

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

Uma conta a receber representa um valor que a empresa tem a cobrar do cliente. Ela pode nascer automaticamente da mensalidade, instalação ou venda, ou ser lançada manualmente na aba **Financeiro** do contrato para uma cobrança específica.

**Nova Conta** não substitui a geração recorrente de mensalidades. Use-a para lançamentos avulsos ou correções operacionais previamente validadas; criar manualmente uma mensalidade pode duplicar uma competência já gerada ou que ainda será processada automaticamente.

## Relação com contrato, serviço e cobrança

Toda conta criada por esta tela pertence ao contrato. O vínculo com **Serviço** é opcional, mas é importante quando a origem e o tratamento fiscal devem identificar o serviço contratado. Ao escolhê-lo, a tela preenche as contas de boleto e Pix configuradas naquele serviço; elas ainda podem ser revisadas antes de salvar.

A **Conta Bancária [Boleto]** é obrigatória e define a carteira, multa, juros, numeração do documento e integração de cobrança. **Conta Bancária [PIX]** só lista carteiras habilitadas para Pix e pode complementar a cobrança.

Contas abertas do mesmo contrato, banco e vencimento podem compartilhar o mesmo número de documento (`NRDOC`) enquanto o agrupamento ainda não tiver sido remetido. Na impressão ou registro, esses itens podem compor uma única cobrança pelo valor somado.

## Como lançar

1. Abra **Contratos**, localize o cliente e acesse **Financeiro**.
2. Confira a grade e os filtros de data/situação para evitar duplicidade.
3. Clique em **Nova Conta**.
4. Se a cobrança tiver origem em um item contratado, selecione o **Serviço** e confira as contas bancárias preenchidas.
5. Escolha a carteira de **Boleto** e, se aplicável, a de **PIX**.
6. Selecione o **Tipo**, descreva a origem do valor e informe o primeiro vencimento.
7. Informe o **Valor** de cada conta e a quantidade de **Parcelas**.
8. Quando exibido, limite o **Número Máximo de Parcelas para Pagamento no Cartão**.
9. Salve e confira todas as contas criadas, seus vencimentos, banco, documento e situação.

## Tipos e efeitos

A tela permite **Mensalidade**, **Serviço**, **Vendas**, **Instalação**, **Acordo** e **Multas**. O tipo não é apenas uma etiqueta: ele participa de relatórios e da seleção de valores para emissão fiscal.

No lançamento manual, promoções são ignoradas para os tipos que não são mensalidade. Para **Mensalidade**, o código atual ainda consulta a promoção vinculada ao serviço e pode aplicar seu desconto. Confirme o valor resultante na grade.

## Como funciona o campo Parcelas

**Valor é o valor de cada parcela, não o total a dividir.** Por exemplo, valor de R$ 100,00 e três parcelas cria três contas de R$ 100,00, totalizando R$ 300,00.

Cada parcela recebe um vencimento mensal a partir da data informada. O sistema tenta preservar o dia original ao avançar os meses. O cadastro não grava numeração “1/3” específica nessa rotina; são contas independentes com a mesma descrição.

Valores não positivos, datas inválidas e tipos fora da lista são recusados. Se **Parcelas** for zero, vazia ou inválida, o backend assume uma parcela.

## Registro no banco ou gateway

Depois de gravar cada conta, o LHISP chama o processador da carteira. Dependendo da conta bancária, isso pode registrar imediatamente boleto/Pix ou preparar o estado de integração. Assim, salvar pode produzir uma cobrança externa, não apenas uma linha local.

Cada parcela é processada em sua própria transação. Se uma parcela posterior falhar no gateway, as anteriores podem já ter sido criadas e registradas. Após qualquer erro, confira a grade e o portal do banco/gateway antes de repetir o lançamento; refazer o formulário inteiro pode duplicar as parcelas concluídas.

## Consulta e ciclo posterior

A grade mostra descrição, tipo, número do documento, vencimento, pagamento, valor, desconto, valor pago, tarifa, nota fiscal e situação. Os estados principais são **Em aberto**, **Paga**, **Cancelada** e **Negociada**. **Exibir Contas Apagadas** serve para auditoria de registros removidos.

Depois da criação, a conta pode participar de:

- impressão ou registro de boleto e Pix;
- remessa e retorno bancário;
- baixa manual ou automática, com movimentação no caixa;
- prorrogação, negociação, cancelamento ou exclusão, conforme permissões e estado bancário;
- emissão fiscal, quando o tipo e as demais regras forem elegíveis.

O botão **Gerar Carnê** da mesma aba executa outra rotina: procura mensalidades ausentes em um período e as gera com base nos serviços contratados. **Relatório de Quitação de Débitos** apenas produz o relatório correspondente.

## Conferências antes e depois de salvar

| Situação | Conferência recomendada |
|---|---|
| Serviço não selecionado | Confirme se a cobrança pode ficar sem rastreabilidade para um serviço e sem suas contas bancárias padrão. |
| Carteira não aparece | Verifique o cadastro da conta bancária e o acesso da filial. |
| Valor total inesperado | Multiplique o valor informado pela quantidade de parcelas; o sistema não divide um total. |
| Conta não aparece | Amplie o período e selecione situação **Aberta** ou **Todas**. |
| Erro de gateway | Não repita imediatamente; confira quais parcelas já existem local e externamente. |
| Mensalidade manual | Pesquise a mesma competência e considere a geração automática/futura antes de criar. |

![Aba Financeiro](/assets/screenshots/contratos/financeiro-aba.png)

![Modal Nova Conta a Receber](/assets/screenshots/contratos/nova-conta-receber-modal.png)
