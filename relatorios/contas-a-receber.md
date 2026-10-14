---
title: Contas a Receber
published: true
editor: markdown
description: Consulte títulos e totais com filtros financeiros, confira diferenças do CSV e opere o cancelamento em massa.
---

# Contas a Receber

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O relatório reúne títulos dos contratos e calcula os totais sobre **todo o resultado filtrado**, mesmo quando a tabela mostra uma página. É uma consulta financeira com uma ação administrativa de cancelamento; não efetua recebimentos.

## Aplicar a pesquisa

1. Abra **Relatórios > Contas a Receber**.
2. Escolha **Filial**, intervalo de **Vencimento** e situações **Aberta**, **Paga** e/ou **Cancelada**. Inicialmente, as três estão marcadas e o período é o mês corrente.
3. Abra **Mais filtros** para refinar o recorte.
4. Clique na lupa de **Exibir contas**. Alterar o formulário sozinho não aplica a pesquisa.
5. Confira os cartões, a distribuição por dia de vencimento e as linhas antes de imprimir ou baixar arquivos.

Os filtros e a consulta respeitam a empresa e o escopo de filiais da sessão. **Desmarcar todas as situações deixa a consulta sem restrição de situação**, podendo incluir estados além dos três exibidos, como contas negociadas.

## Filtros e datas

| Filtro | O que seleciona |
|---|---|
| **Vencimento** | Intervalo do vencimento original dos títulos. Continua aplicado quando também se filtra pagamento. |
| **Criação** | Data de geração do título. Usuário seleciona quem criou a conta, não quem a baixou. |
| **Pagamento** | Data de pagamento dentro do intervalo; informe os dois limites para aplicar o recorte. |
| **Categoria / Segmento do contrato** | Classificações do contrato associado. |
| **Tipo / Tipo de pessoa** | Natureza do título e pessoa física/jurídica. |
| **Baixa** | Meio de pagamento gravado, ou **Sem recebimento** para baixas sem entrada de dinheiro. |
| **Pagamento em dias / atrasados** | Somente contas pagas com data de pagamento; compara com prorrogação, quando houver, ajustada para o próximo dia útil. |
| **Notas fiscais** | Com NF, sem NF ou todas; os filtros com/sem também habilitam a identificação da nota. |
| **Serviços Ativos** | Inclui serviços ativos, bloqueados e pendentes. |
| **Serviços Cancelados** | Inclui cancelados, suspensos e desativados. |
| **Registro do boleto** | Considera registrado quando já entrou em remessa ou possui status de registro pela integração. Isso não comprova aceitação de uma remessa pelo banco. |
| **Conta bancária, UF, cidade e servidor** | Restringe a carteira ou os vínculos de endereço/acesso do contrato/serviço. Cidade depende da UF. |
| **Somente canceladas pelo banco** | Usa o indicador bancário de cancelamento, distinto da situação financeira Cancelada. |

O limite final de **Criação** é enviado sem horário de fim do dia. Registros gerados mais tarde nessa data podem exigir conferência individual; não confunda esse limite com os campos de vencimento e pagamento, que são datas dos títulos.

## Interpretar valores

| Cartão/total | Cálculo atual |
|---|---|
| **Total previsto** | Valor nominal menos descontos das contas não canceladas do recorte. |
| **Contas a receber** | Soma dos saldos nominais menos recebido e desconto para contas que não estão pagas nem canceladas, sem parcelas negativas. Não adiciona encargos futuros. |
| **Contas pagas** | Soma do valor pago registrado em todas as linhas do recorte; pode incluir recebimentos parciais ou valores de contas depois canceladas. |
| **Multa e juros** | Soma das diferenças positivas entre valor pago e nominal; não é uma apuração separada dos eventos de multa e juros. |
| **Tarifas / Líquido** | Tarifas das linhas e valor pago menos essas tarifas. |
| **Contas canceladas** | Valor nominal menos pago das contas canceladas, limitado a zero por conta. |

O desconto percentual é convertido para valor em cada título. Os totais das colunas Valor, Desconto, Tarifa e Valor pago incluem também linhas canceladas. Por isso não precisam coincidir com o cartão Previsto.

O gráfico por dia mistura **recebido das contas pagas** e **saldo das demais contas não canceladas**, agrupados pelo dia do vencimento. Ele não é um gráfico exclusivo de pagamentos realizados naquele dia. Quando NF está habilitada, o resumo fiscal agrupa notas por competência e separa registros sem NF.

## Paginação, impressão e CSV

A tela inicia com 50 registros por página e permite escolher de 10 a 5.000. A quantidade de linhas da página não altera os totalizadores.

**Imprimir** busca todas as páginas do resultado aplicado, em lotes de mil, e produz a listagem com resumo. **Baixar planilha** oferece CSV comum e o formato **Serasa Limpa Nome**; baixar esse arquivo não transmite dívidas à Serasa.

A exportação CSV usa processamento legado próprio. Na versão revisada, **não aplica o intervalo de Criação**, e o filtro de pagamentos em dia/atrasados pode divergir quando as situações são enviadas em conjunto. Há também diferença no arredondamento de descontos percentuais. Para conferir exatamente o recorte exibido, prefira a impressão da listagem e compare quantidade e totais antes de usar o CSV em conciliação ou integração.

## Cancelamento em massa

A ação aparece para administradores gerais **admin/master**. Ela considera somente contas abertas nos **filtros já aplicados**, em todas as páginas; não depende de selecionar linhas da página atual.

1. Aplique e revise os filtros.
2. Abra **Ações > Cancelamento em massa** e confira quantidade, valor original, descontos e valor a receber.
3. Informe o motivo, com até 500 caracteres na interface.
4. Clique em **Cancelar contas** e depois em **Confirmar cancelamento irreversível**.
5. Aguarde o processamento e confira canceladas, ignoradas, falhas e não processadas.

As contas são canceladas em lotes de até 25, com tratamento individual. Contas que deixaram de estar abertas são ignoradas; erros não desfazem automaticamente os sucessos anteriores. O fluxo solicita cancelamento bancário quando aplicável, mas a conclusão local não prova a confirmação do banco. Confira histórico e integração antes de repetir ou emitir substituições.

O ícone de ambulância abre a tela legada. Para receber ou conciliar um título, use a [Gerência Financeira](/financeiro/gerencia-financeira); para consulta por documento, use [Contas a Receber por Cliente](/relatorios/contas-a-receber-por-cliente).
