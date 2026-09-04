---
title: Entrada de material
published: true
editor: markdown
description: Registre recebimentos avulsos ou patrimoniais sem perder saldo, série e origem fiscal.
---

# Entrada de material

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A entrada aumenta o saldo de um produto em um almoxarifado e cria o histórico que explica sua origem. O procedimento correto depende de o produto possuir controle patrimonial e de existir uma nota fiscal de compra.

Veja também [Almoxarifados](/estoque/almoxarifados), [Notas fiscais de compra](/estoque/notas-fiscais-de-compra) e [Material para técnico](/estoque/material-para-tecnico).

## Escolher o fluxo correto

| Situação | Fluxo recomendado | Resultado |
|---|---|---|
| Compra documentada, produto comum | Lance os produtos na nota fiscal de compra | Entrada vinculada à nota e conciliação do item fiscal com o produto. |
| Produto sem nota e sem controle patrimonial/série | Use **Almoxarifados > Adicionar movimentação > Entrada** | Entrada avulsa com descrição operacional. |
| Produto patrimonial comprado | Lance a nota e depois use **Estoque > Patrimônio > Lançar patrimônio** | Uma unidade e um patrimônio por número de série, vinculados à nota. |
| Devolução de técnico ou cliente | Use a devolução/recolhimento do processo original | Retorno do saldo e do patrimônio com rastreabilidade da origem. |

Não use entrada avulsa para simular compra, devolução ou transferência. Embora o saldo aumente, as referências fiscal e operacional ficam ausentes.

## Entrada avulsa de produto comum

1. Acesse **Almoxarifados** e selecione a unidade.
2. Clique em **Adicionar movimentação** e escolha **Entrada**.
3. Localize o produto.
4. Selecione o local interno do almoxarifado.
5. Informe uma descrição que identifique a origem e a quantidade inteira positiva.
6. Confirme e consulte o histórico do produto.

A ação exige `estoque_add_mov`. O backend obtém ou cria a linha de estoque para a combinação de almoxarifado, local e produto, soma a quantidade e grava tudo em uma transação.

Produtos com controle patrimonial ou exigência de número de série são recusados pela movimentação manual. Neles, o saldo precisa acompanhar os identificadores físicos.

## Entrada vinculada à nota fiscal

Ao lançar os itens de uma nota fiscal de compra, o sistema associa cada descrição fiscal a um produto existente ou cria um produto na categoria **Importado de Nota Fiscal de Compra**. Para produtos comuns, a quantidade é adicionada ao almoxarifado e o histórico recebe a referência da nota.

Produtos patrimoniais ou controlados por série não entram em quantidade nessa etapa. A nota é marcada como material lançado, mas as unidades ficam pendentes para leitura individual no controle patrimonial.

## Lançar patrimônios

Na página **Lançar patrimônio**:

1. selecione o almoxarifado;
2. escolha uma nota fiscal que ainda possua item patrimonial pendente;
3. selecione o produto e confira o saldo de unidades a identificar;
4. leia ou digite o número de série;
5. repita até completar a quantidade da nota.

Também é possível colar uma lista, usando uma série por linha ou a primeira coluna copiada de planilha. Cabeçalhos, separadores simples e linhas repetidas na própria lista são ignorados; séries com mais de 50 caracteres são recusadas. No processamento em massa, cada série é enviada separadamente, portanto pode haver sucessos e falhas na mesma operação.

Para cada nova série, o backend executa de forma transacional:

- valida que produto e nota pertencem ao item selecionado;
- impede ultrapassar a quantidade autorizada na nota;
- cria ou obtém o estoque do almoxarifado/local;
- cria o patrimônio com quantidade unitária;
- aumenta o saldo e o contador de patrimônios do item fiscal;
- grava históricos de estoque e patrimônio.

Número de série é único na empresa. Se ele já existir, a tela informa o patrimônio encontrado e não aumenta novamente o estoque nem o contador da nota. O modelo também valida a unicidade de número patrimonial e MAC quando esses identificadores são usados.

A página atual de lançamento por nota envia somente o número de série. Se o cadastro do produto também exigir número patrimonial ou MAC, o backend recusará a inclusão porque esses campos obrigatórios não são fornecidos por essa tela. Regularize o cadastro ou solicite um fluxo compatível antes de receber esse tipo de item; não desative o controle apenas para forçar saldo.

Para produtos configurados na integração Intelbras Mibo, o cadastro de um novo patrimônio pode publicar uma sincronização após a confirmação da entrada.

## Conferência

Depois do lançamento, confirme:

- quantidade no almoxarifado e local corretos;
- histórico com descrição ou nota fiscal de origem;
- quantidade patrimonial igual ao número de séries lidas;
- cada equipamento disponível no **Controle patrimonial**;
- ausência de séries, MACs ou números patrimoniais duplicados.

| Problema | Verificação |
|---|---|
| Entrada manual recusada | O produto possui controle patrimonial ou exige série; use uma nota fiscal e o lançamento patrimonial. |
| Nota não aparece para leitura | Ela precisa conter produto patrimonial com quantidade ainda não identificada. |
| Produto não aparece na nota | Concilie/lance os itens fiscais e confirme que o item foi associado ao produto correto. |
| Limite de patrimônios atingido | Todas as unidades autorizadas no item fiscal já foram identificadas. |
| Série aparece como existente | Localize o patrimônio informado; a repetição não gera nova entrada. |
| Produto exige patrimônio ou MAC | A tela atual por nota não coleta esses valores; encaminhe a configuração/fluxo para correção antes do lançamento. |
| Algumas séries da lista falharam | Consulte as leituras concluídas e reprocesse somente as séries indicadas como falha. |

![Almoxarifados](/assets/screenshots/estoque/almoxarifados.png)

![Nova movimentação](/assets/screenshots/estoque/nova-movimentacao.png)
