---
title: Clientes para Cobrança
published: true
editor: markdown
description: Selecione contas abertas por atraso, vencimento e situação do serviço, com modelo padrão ou Assertiva.
---

# Clientes para Cobrança

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O relatório legado `relatorios/inadimplencia` é uma carteira de **contas abertas elegíveis para cobrança**. Cada linha representa uma conta a receber, mesmo quando o rodapé ou a legenda utilizam a palavra cliente.

## Seleção

| Filtro | Aplicação |
|---|---|
| **Filial** | Filial do contrato, dentro do acesso do usuário. |
| **Plano** | Trecho literal da descrição do serviço contratado; a comparação diferencia maiúsculas e minúsculas. |
| **Vencimento** | Intervalo inclusivo do vencimento original da conta, aplicado quando início e fim estão preenchidos. |
| **Situação** | Situação atual do serviço: ativo, bloqueado ou cancelado; vazio não restringe esse campo. |
| **Somente clientes inclusos no SPC** | Exige a marcação SPC na pessoa. |
| **Ordenar por** | Dias de atraso ou identificador interno do contrato. |
| **Modelo** | Padrão ou Assertiva Cobranças. |

A conta deve estar em aberto e alcançar a quantidade de dias configurada pela empresa em **Dias para cobrança**. O atraso é calculado até hoje usando a **prorrogação**, quando existe; caso contrário, usa o vencimento. O filtro de período continua usando o vencimento original. Essa diferença pode explicar uma conta dentro do intervalo que ainda não alcança o atraso mínimo.

## Gerar e interpretar

1. Abra **Relatórios > Clientes para Cobrança** com sessão e acesso ao formulário.
2. Preencha os dois limites de vencimento e o recorte desejado.
3. Clique em **Exibir**.
4. Confira valores e contatos antes de usar **Imprimir** ou encaminhar a carteira.

O modelo padrão mostra contrato, filial, cliente, endereço, plano, telefones, vencimento, dias de atraso, valor nominal, valor pago e valor atual calculado para hoje. O modelo Assertiva apresenta documento, nome, observações/plano, telefones, e-mail, número do contrato, tipo de dívida, valor nominal, vencimento e número de documento da cobrança.

Os totais distinguem **contratos únicos** de **contas abertas**. Os destaques de ativos, bloqueados e cancelados contam linhas de contas, não titulares únicos. Uma pessoa com vários títulos pode aparecer várias vezes. O valor atual segue o cálculo financeiro da conta; não é apenas o valor nominal somado.

## Limites

Esta tela consulta e imprime. Não envia a carteira automaticamente a uma empresa de cobrança, não notifica clientes e não baixa contas. O modelo Assertiva altera as colunas da listagem; não há botão próprio de exportação CSV nessa implementação.

Contas cuja pessoa não é localizada ou cujo valor atual não pode ser calculado são puladas pela listagem. Para explicar diferenças de total, confira os registros diretamente em **Financeiro** e com o suporte.

Veja também [Clientes Negativados](/relatorios/clientes-negativados-spc) e [Gerência Financeira](/financeiro/gerencia-financeira).
