---
title: Formas de Pagamento
published: true
editor: markdown
description: Regras de entrada e parcelamento usadas no faturamento de vendas.
---

# Formas de Pagamento

Uma forma de pagamento define como um valor será dividido entre entrada e parcelas. Ela é usada pelo backend para transformar uma venda faturada em uma ou mais contas a receber e também pode ser adotada por integrações que cobram itens ou ativações, como a AloFone.

O cadastro é uma regra de parcelamento, não o meio pelo qual o cliente pagará o boleto. A conta bancária define a cobrança; a forma de pagamento define a distribuição do total e os vencimentos.

## Como o parcelamento é calculado

Ao faturar, o LHISP aplica a forma selecionada ao valor total:

- se houver entrada, cria uma conta com vencimento na data inicial;
- o percentual de entrada calcula o valor quando o fluxo não fornece uma entrada fixa;
- quando o fluxo informa um valor fixo de entrada, esse valor prevalece sobre o percentual cadastrado;
- o saldo é dividido igualmente pela quantidade de parcelas;
- cada parcela vence um mês depois da anterior; a primeira parcela vence um mês após a data inicial;
- diferenças de centavos da divisão são acrescentadas à última parcela;
- as descrições identificam **ENTRADA** ou **PARCELA N DE TOTAL**.

Exemplo: entrada de 33% e duas parcelas sobre R$ 100,00 gera R$ 33,00 na data inicial e duas parcelas de R$ 33,50 nos dois meses seguintes.

## Cadastro

1. Acesse **Cadastros > Financeiro > Formas de Pagamento**.
2. Clique em **Cadastrar** ou abra uma forma existente.
3. Informe entrada, quantidade de parcelas e juros.
4. Revise a descrição sugerida automaticamente pela SPA.
5. Salve.

| Campo | Comportamento |
|---|---|
| **Descrição** | Nome único da regra. A SPA sugere textos como **A VISTA** ou **ENTRADA + 2X SEM JUROS**, mas o texto pode ser editado. |
| **Parcelas** | Quantidade de contas futuras geradas depois da entrada. O backend aceita no máximo 36. |
| **Entrada (%)** | Percentual cobrado na data inicial. Aceita de 0% a 100%. |
| **Juros (%)** | Percentual armazenado na forma de pagamento. |

> **Limitação verificada:** o cálculo atual do backend divide o total original e não aplica o percentual do campo **Juros** ao valor das parcelas. Não use esse campo como garantia de acréscimo automático sem validar o fluxo de faturamento utilizado.

## Regras importantes

- A descrição é obrigatória e não pode duplicar outra forma ativa da empresa.
- Entrada, parcelas e juros precisam ser numéricos.
- Entrada superior a 100% é rejeitada.
- Uma entrada de 100% não pode ser combinada com parcelas.
- A exclusão é lógica e não altera vendas nem contas a receber já geradas.
- Alterar uma forma afeta novos cálculos. Faturas já criadas permanecem com valores e vencimentos próprios.

## Relações com outras funcionalidades

- **Vendas:** ao faturar, o total dos itens, descontados os descontos, é parcelado e gera contas a receber vinculadas à venda e ao contrato.
- **Contas bancárias:** a conta escolhida no faturamento é gravada nas contas a receber geradas.
- **Estoque:** depois do faturamento, a venda passa a aguardar a entrega/saída de material.
- **AloFone:** a configuração da integração pode exigir uma forma de pagamento para cobrar a ativação de chip.

## Antes de alterar ou excluir

Identifique os fluxos e integrações que usam a forma. Prefira criar uma nova regra quando a condição comercial mudou; isso preserva a interpretação histórica das vendas antigas.

## Captura da tela

![Listagem de formas de pagamento](/assets/screenshots/cadastros/financeiro/formas-de-pagamento.png)
