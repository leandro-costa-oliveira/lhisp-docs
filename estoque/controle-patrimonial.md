---
title: Controle patrimonial
published: true
editor: markdown
description: Localize equipamentos por série, identifique seus vínculos e corrija o produto de unidades disponíveis no almoxarifado.
---

# Controle patrimonial

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O **Controle Patrimonial**, em `/estoque/patrimonio`, consulta as unidades físicas dos produtos com controle patrimonial. A identificação individual acompanha o equipamento no almoxarifado, com o funcionário, em separação, remessa, venda ou locação.

Para receber novas unidades, use **Lançar Patrimônio**, em `/estoque/patrimonio/lancar`. O procedimento por nota fiscal e as limitações de série, MAC e número patrimonial estão em [Entrada de material](/estoque/entrada-de-material).

## Localizar uma unidade

1. Informe almoxarifado, parte do nome do produto, número de série ou número de patrimônio.
2. Clique em **Pesquisar** para aplicar os campos.
3. Confira produto, almoxarifado, série, patrimônio, MAC e **Vínculo**.
4. Use **Carregar mais** para ampliar o resultado em grupos de 20.

O vínculo pode indicar contrato, funcionário, venda, locação, ordem de separação, remessa ou estoque. **Extraviado** tem prioridade na identificação exibida. A ausência de vínculo legível merece conferência antes de movimentar a unidade.

## Interpretar os totais

**Total de itens** consulta todo o resultado dos filtros. **Carregados**, **Em estoque**, **Vinculados**, **Extraviados**, **Produtos distintos** e **Almoxarifados** resumem somente as unidades já carregadas. Enquanto houver **Carregar mais**, esses subtotais não representam o inventário completo filtrado.

## Alterar produto do patrimônio

A ação **Alterar Produto** corrige a associação de uma unidade disponível em estoque. Selecione a nota fiscal de compra de destino e um produto patrimonial com saldo disponível nessa nota.

O backend exige que a unidade esteja no estoque do almoxarifado e recusa vínculos com venda, locação, ordem de separação, remessa ou estoque de funcionário. Também impede ultrapassar a quantidade de patrimônios autorizada no item da nota de destino.

A correção mantém a unidade identificada, ajusta os saldos dos produtos no mesmo almoxarifado/local, atualiza os contadores das notas envolvidas e registra históricos. Ela não substitui a transferência entre almoxarifados nem a devolução de material de técnico ou cliente.

## Intelbras Mibo

Quando a integração Intelbras Mibo está ativa e possui produtos configurados, a consulta oferece **Somente aparelhos** e a coluna **Sync Intelbras**. Os rótulos incluem estados pendentes de Blacklist/Whitelist, Blacklist, Whitelist e erro.

Use o estado de sincronização para conferir a integração; o vínculo patrimonial informa a localização operacional no LHISP. Uma unidade vinculada no sistema pode ainda ter sincronização pendente ou com erro.

Veja também [Produtos](/cadastros/estoque/produtos), [Ordens de separação](/estoque/ordens-de-separacao), [Remessa de material](/estoque/remessa-de-material) e [Estoque por funcionário](/estoque/estoque-por-funcionario).
