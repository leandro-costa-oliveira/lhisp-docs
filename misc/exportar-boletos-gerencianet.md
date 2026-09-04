---
title: Imprimir boletos do Gerencianet
published: true
editor: markdown
description: Seleção e impressão dos PDFs de boletos emitidos pela integração Gerencianet/Efí
---

# Imprimir boletos do Gerencianet

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

Os boletos emitidos pela integração identificada no LHISP como **Gerencianet** possuem uma URL de cobrança gerada pelo provedor. Na **Impressão de Carnês**, o sistema pode incorporar esse PDF em vez de montar o boleto com o modelo bancário local.

Esse fluxo apenas seleciona, exibe e imprime cobranças já emitidas. Ele não cria boletos, não registra pagamentos e não consulta a situação na Gerencianet/Efí. A emissão e a baixa pertencem à integração da [Conta Bancária](/cadastros/financeiro/contas-bancarias); os títulos continuam sendo acompanhados na [Gerência Financeira](/financeiro/gerencia-financeira).

## Requisitos

- Conta bancária com carteira **Gerencianet**, credenciais de cliente configuradas e opção de impressão pelo PDF do gateway habilitada.
- Conta a receber em aberto, emitida por essa carteira e com URL de boleto gravada.
- Permissão para acessar **Financeiro > Impressão de Carnês**.
- Navegador autorizado a carregar o PDF hospedado externamente.

Se a URL não existir ou a opção de PDF estiver desabilitada, o LHISP usa o modelo local de boleto configurado na carteira.

## Seleção dos boletos

1. Acesse **Financeiro > Impressão de Carnês**.
2. Selecione a filial e a conta bancária Gerencianet.
3. Informe o período de faturamento e, se necessário, filtre por vencimento, setor, rede, plano ou endereço.
4. Mantenha **Não impressos** para o primeiro envio ou escolha **Impressos/Todos** para segunda via.
5. Defina quantos contratos serão processados na página e clique em **Exibir**.
6. Confira clientes, valores, vencimentos e documentos carregados.
7. Clique em **Imprimir** para abrir a impressão do conteúdo exibido no navegador.
8. Somente após confirmar a saída, clique em **Confirmar** para marcar os títulos como impressos.

A paginação é feita por quantidade de **contratos**, não pela quantidade de boletos. Avance o número da página para processar o próximo lote.

## Como o documento é montado

A consulta inclui somente contas a receber em aberto que atendam aos filtros. Componentes do mesmo contrato, conta bancária e número de documento são agrupados: suas descrições e valores são somados e o documento é exibido uma única vez.

Quando a conta possui URL e a carteira aceita o PDF externo, cada documento é incorporado na área de visualização. Se o navegador não renderizar o PDF, use o link apresentado abaixo dele para abrir a cobrança em outra aba.

## Exibir, imprimir e confirmar

As três ações não são equivalentes:

| Ação | Efeito |
|---|---|
| **Exibir** | Refaz a consulta e carrega os documentos, sem alterar o contador de impressão. |
| **Imprimir** | Aciona a impressão do navegador; não marca os títulos no banco. |
| **Confirmar** | Refaz a consulta e incrementa o contador de impressão de todas as contas que compõem os documentos exibidos. |

O filtro padrão **Não impressos** considera contas cujo contador ainda é zero. Depois da confirmação, elas deixam de aparecer nesse filtro, mas continuam disponíveis em **Impressos** ou **Todos**.

> **Atenção:** confirme somente o mesmo lote que acabou de imprimir. Alterar filtros, página ou dados entre as ações pode marcar um conjunto diferente daquele enviado à impressora.

## Problemas comuns

| Situação | O que verificar |
|---|---|
| Conta bancária não aparece | Acesso do usuário à conta, filial e configuração da carteira. |
| Seleção vazia | Período de faturamento, situação em aberto, conta bancária, vencimento e demais filtros. |
| Modelo local aparece no lugar do PDF | Presença da URL no título e opção de impressão do PDF na carteira. |
| Área do PDF fica vazia | Bloqueio do navegador a conteúdo externo; tente o link de visualização em nova aba. |
| Boleto sumiu de **Não impressos** | O contador foi incrementado; localize-o em **Impressos** ou **Todos**. |
| Impressão saiu incompleta | Reduza a quantidade de contratos por página e processe lotes menores. |

Para o comportamento geral da seleção, segunda via e confirmação, consulte [Impressão de Carnês](/financeiro/impressao-de-carnes).
