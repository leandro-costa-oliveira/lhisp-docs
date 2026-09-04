---
title: Remessa de Material
published: true
editor: markdown
description: Acompanhamento e recebimento de materiais em trânsito entre almoxarifados
---

# Remessa de Material

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A remessa representa material que já saiu de um almoxarifado, mas ainda não entrou no saldo de outro. Ela evita que uma transferência seja tratada como instantânea e permite que o almoxarifado de destino confirme o recebimento físico dos produtos e patrimônios enviados.

Na aplicação atual, a remessa não é cadastrada manualmente por esta tela. Ela é criada automaticamente quando uma [Ordem de Separação](/estoque/ordens-de-separacao) do tipo **Transferência de almoxarifado** tem a entrega confirmada.

## Ciclo da transferência

```text
Ordem aguardando entrega
        ↓ confirmação da saída
Saldo retirado da origem + remessa em aberto
        ↓ confirmação do recebimento
Saldo incluído no destino + remessa concluída
```

As duas confirmações têm responsabilidades diferentes:

- **Confirmar Entrega**, na ordem de separação, registra o despacho e reduz o estoque de origem;
- **Confirmar Recebimento**, na remessa, registra a chegada e aumenta o estoque de destino.

Enquanto a remessa está **Em aberto**, seus itens estão em trânsito e não compõem o saldo disponível de nenhum dos dois almoxarifados. Não crie uma entrada manual no destino para antecipar esse recebimento, pois a confirmação posterior duplicará o saldo.

## Consulta e conferência

A listagem permite filtrar por almoxarifado de origem, almoxarifado de destino, situação e intervalo de criação. A busca textual é aplicada ao nome do almoxarifado de origem.

Ao abrir uma remessa, confira:

- origem e destino esperados;
- situação atual;
- produto e quantidade de cada item;
- números de série ou patrimônios relacionados.

O documento é somente para consulta e recebimento: origem, destino e itens não são editados nessa etapa. Divergências devem ser apuradas antes da confirmação.

## Produtos com controle patrimonial

Cada unidade controlada é identificada individualmente na ordem e vinculada ao item da remessa durante o trânsito. O backend exige que a quantidade de patrimônios relacionados seja exatamente igual à quantidade do item antes de concluir o recebimento.

Ao confirmar, os patrimônios são movidos para o saldo do almoxarifado de destino e recebem histórico da transferência. Se faltar uma unidade, houver associação incorreta ou o produto não existir, a operação falha por inteiro.

## Confirmação do recebimento

O botão **Confirmar Recebimento** aparece para remessas em aberto e exige a permissão `remessa_material_confirmar_recebimento`. Antes de confirmar, faça a conferência física completa: a tela não oferece recebimento parcial nem edição das quantidades.

A confirmação é executada em uma única transação. Para cada item, o sistema valida a quantidade, o produto e os patrimônios, cria a entrada no almoxarifado de destino e vincula o histórico à remessa. Somente depois de processar todos os itens a situação passa para **Concluída**.

Uma remessa concluída não pode ser recebida novamente nem excluída.

## Cancelamento por exclusão

A exclusão de uma remessa em aberto exige `remessa_material_del`. Quando ela foi originada por uma ordem de separação, o backend devolve todos os itens ao almoxarifado de origem, move os patrimônios de volta ao estoque e só então remove a remessa, tudo na mesma transação.

Uma remessa em aberto sem ordem de origem não pode ser excluída automaticamente, porque o sistema não consegue comprovar de onde deve recompor o saldo. Nesse caso, a mensagem orienta devolver o material manualmente antes da exclusão.

Excluir a remessa não desfaz nem reabre a ordem de separação que registrou o despacho. Por isso, use o cancelamento apenas após confirmar que o material efetivamente retornou à origem e preserve a justificativa operacional.

## Situações

| Situação | Significado |
|---|---|
| **Em aberto** | A saída da origem já ocorreu; os itens aguardam conferência e entrada no destino. |
| **Concluída** | O recebimento foi confirmado e o saldo foi adicionado ao almoxarifado de destino. |

## Cuidados importantes

- Nunca confirme apenas com base no registro do sistema; confronte quantidades e séries com o material recebido.
- O recebimento é integral. Se houver divergência, não confirme até resolver a ocorrência.
- Uma remessa em aberto explica por que um item retirado da origem ainda não aparece no destino.
- Não faça movimentações paralelas para compensar uma remessa sem antes verificar seu estado, pois isso pode duplicar estoque.
- Use os vínculos da remessa e da ordem de separação para rastrear a transferência no histórico do estoque.

![Remessa de Material no demo](/assets/screenshots/estoque/remessa-de-material.png)
