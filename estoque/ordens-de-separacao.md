---
title: Ordens de Separação
published: true
editor: markdown
description: Preparação e despacho de materiais do almoxarifado para técnicos, transferências ou infraestrutura
---

# Ordens de Separação

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A ordem de separação formaliza a retirada de materiais de um almoxarifado. Ela identifica o estoque de origem, o destino operacional e os produtos ou patrimônios que serão despachados. Salvar a ordem apenas registra o pedido; a saída efetiva do estoque ocorre quando o usuário confirma a entrega.

Esse fluxo mantém rastreabilidade entre o saldo do almoxarifado, o estoque em poder do técnico e as remessas em trânsito. Também é usado como etapa posterior de solicitações de material autorizadas.

## Tipos e efeitos da confirmação

| Tipo | Destino do material | Efeito ao confirmar |
|---|---|---|
| **Para técnico** | Técnico responsável | Retira do almoxarifado e adiciona ao [Estoque por Funcionário](/estoque/estoque-por-funcionario). |
| **Transferência de almoxarifado** | Outro almoxarifado | Retira da origem e cria uma [Remessa de Material](/estoque/remessa-de-material) em aberto. O destino só recebe o saldo após confirmar a remessa. |
| **Infraestrutura** | Uso interno em infraestrutura | Retira do almoxarifado sem criar saldo para funcionário ou remessa. |

A ordem começa em **Aguardando entrega** e passa diretamente para **Concluída** depois da confirmação. Os estados **Aberta** e **Material separado** existem no modelo e podem aparecer em registros de outros fluxos, mas a tela atual cria novas ordens já aguardando entrega.

## Criação da ordem

1. Em **Estoque > Ordens de Separação**, abra um novo cadastro.
2. Selecione o almoxarifado de origem e o tipo da ordem.
3. Para entrega a técnico, informe o responsável. Para transferência, informe um almoxarifado de destino diferente da origem.
4. Adicione ao menos um item existente no saldo do almoxarifado.
5. Confira as quantidades e salve.

O backend exige um tipo válido, almoxarifado existente, quantidade maior que zero e pelo menos um item. Para produtos comuns, itens repetidos do mesmo saldo são somados na tela. A disponibilidade é validada novamente somente na confirmação, pois o saldo pode mudar entre a criação e o despacho.

## Produtos com controle patrimonial

Para um produto com controle patrimonial, selecione a unidade pelo número de série ou patrimônio. Cada patrimônio ocupa um item com quantidade igual a **1** e fica associado à ordem enquanto aguarda o despacho. O mesmo patrimônio não pode ser incluído duas vezes.

Na confirmação:

- para um técnico, o patrimônio é movido ao estoque desse funcionário;
- para uma transferência, o vínculo passa da ordem para a remessa e permanece em trânsito até o recebimento;
- toda mudança gera histórico e preserva a identificação individual da unidade.

Não substitua um patrimônio controlado por uma quantidade genérica. A associação individual é o que permite localizar o bem depois da entrega.

## Confirmação da entrega

Use **Confirmar Entrega** somente depois de conferir fisicamente o material separado. O backend verifica se a ordem ainda está em **Aguardando entrega**, se cada item está vinculado a um saldo de estoque e se existe quantidade suficiente.

Todos os itens são processados em uma única transação. Se qualquer produto estiver sem saldo ou algum patrimônio não puder ser movimentado, nenhuma saída da ordem é concluída. Em caso de erro, atualize a ordem ou recomponha o saldo antes de tentar novamente.

> **Comportamento atual:** a grade permite editar **Qtd. Entregue**, mas esse valor não é persistido nem usado na confirmação. O backend sempre movimenta a **Qtd. Solicitada**. Para uma entrega parcial, remova e adicione novamente o item com a quantidade que será entregue, salve a ordem e somente então confirme.

Após a confirmação, não é possível incluir itens nem confirmar novamente. A impressão serve como apoio à conferência física, mas não altera a situação da ordem.

## Relação com solicitações de material

Uma solicitação autorizada pode originar uma ordem de separação, que então segue este mesmo processo de conferência e despacho. Entretanto, o fluxo atual de autorização de solicitações possui inconsistências entre frontend e backend; consulte [Material para Técnico](/estoque/material-para-tecnico) antes de utilizá-lo. Para operação imediata, a criação direta da ordem é o caminho funcional disponível.

## Alteração e exclusão

Enquanto aguarda entrega, uma ordem pode ter seus itens alterados. Ao salvar uma edição, o backend recria os itens e libera as associações patrimoniais removidas, reassociando as unidades mantidas.

A exclusão exige `ordem_separacao_del`. Como o backend da exclusão não recompõe movimentações já confirmadas, não exclua uma ordem concluída. Para preservar a rastreabilidade, trate correções de saldo por uma movimentação identificada no almoxarifado e mantenha a ordem que originou a saída.

## Cuidados importantes

- Confirme o almoxarifado de origem antes de adicionar itens; cada item fica vinculado ao saldo escolhido.
- O saldo não é reservado ao salvar. Outra operação pode consumi-lo antes da confirmação.
- Em transferências, a confirmação da ordem não conclui a entrada no destino: ela cria material em trânsito.
- Uma ordem para técnico aumenta o estoque do funcionário, que depois pode ser consumido por uma ordem de serviço ou devolvido ao almoxarifado.
- Para patrimônios, confira o número de série individual antes de salvar e antes de entregar.
- Não use **Confirmar Entrega** para registrar quantidade parcial sem antes corrigir a quantidade solicitada.
