---
title: Centros de Custo
published: true
editor: markdown
description: Estrutura de apropriação e análise dos gastos da empresa.
---

# Centros de Custo

Centros de custo classificam **onde** um gasto é apropriado — por exemplo, operação, comercial, administrativo ou manutenção. Seus itens permitem um detalhamento adicional dentro de cada área. Essa classificação acompanha despesas recorrentes e contas a pagar, sustenta filtros financeiros e permite analisar a composição dos gastos.

Centro de custo não é caixa, conta bancária nem categoria financeira. O caixa indica por onde o dinheiro transitou; a categoria indica a natureza do gasto; o centro de custo indica a área ou destino responsável pelo custo.

## Estrutura e uso

Cada centro possui um nome único na empresa e uma lista de itens. Um item pertence a um único centro e pode conter uma descrição usada na conciliação OFX.

Os vínculos aparecem principalmente em:

- [Despesas](/cadastros/financeiro/despesas), que copiam centro e item para as contas geradas;
- contas a pagar criadas manualmente ou por automações;
- importação de folha de pagamento;
- filtros e relatórios de contas a pagar por centro de custo;
- conciliação financeira, quando o item possui uma descrição OFX configurada.

## Cadastro

1. Acesse **Cadastros > Financeiro > Centros de Custo**.
2. Clique em **Cadastrar** ou abra um registro existente.
3. Informe um nome que represente a área de apropriação.
4. Adicione os itens necessários e, quando aplicável, a descrição para conciliação OFX.
5. Salve.

| Campo | Função |
|---|---|
| **Centro de Custo** | Agrupamento principal. O nome é obrigatório e não pode se repetir na empresa. |
| **Descrição do Item** | Segundo nível de classificação dentro do centro. |
| **Conciliação OFX** | Texto de referência usado para relacionar o item a lançamentos importados do extrato. |

Ao salvar uma edição, o backend preserva os itens enviados, cria os novos e remove logicamente os que deixaram de constar no formulário.

> **Atenção:** antes de remover um item, verifique os lançamentos que o utilizam. A retirada do cadastro não reclassifica contas a pagar existentes.

## Transferência de item

A ação **Transferir Item de Centro de Custo** reclassifica contas a pagar em lote. Informe o centro/item de origem e o centro/item de destino.

Por padrão, **Somente Contas a Pagar em Aberto** fica marcado. Se essa opção for desmarcada, contas de outras situações também entram no lote.

Antes da execução, a tela conta as contas afetadas e exige uma confirmação adicional. O backend então:

1. valida a existência dos centros e itens de origem e destino;
2. seleciona as contas que usam a classificação de origem;
3. troca centro e item em cada conta;
4. grava no histórico da conta a origem e o destino da migração.

Essa operação exige permissão específica de transferência e não oferece desfazer automático. Para corrigir uma transferência indevida, é necessário executar outra transferência com os pares invertidos ou ajustar as contas individualmente.

> **Importante:** a transferência altera as contas a pagar selecionadas. Ela não troca a classificação gravada nas despesas recorrentes. Atualize também as despesas de origem quando os lançamentos futuros devam usar o novo centro/item.

## Exclusão e efeitos

A exclusão de centro e itens é lógica. O registro deixa de aparecer nas consultas normais, mas vínculos históricos podem continuar armazenados nas contas existentes. Antes de excluir:

- transfira ou reclassifique contas em aberto;
- revise despesas recorrentes que apontem para o centro/item;
- confirme o impacto nos relatórios e na conciliação OFX.

## Captura da tela

![Listagem de centros de custo](/assets/screenshots/cadastros/financeiro/centros-de-custo.png)
