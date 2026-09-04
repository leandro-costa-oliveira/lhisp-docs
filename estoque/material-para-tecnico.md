---
title: Material para técnico
published: true
editor: markdown
description: Visão completa do abastecimento, responsabilidade, consumo e devolução de material técnico.
---

# Material para técnico

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

Este fluxo controla a passagem de materiais do almoxarifado para a responsabilidade de um técnico e, depois, para uma ordem de serviço, cliente ou devolução. O objetivo operacional é manter três perguntas respondidas: onde está o item, quem responde por ele e em qual atividade ele foi utilizado.

## Fluxo completo

1. Cadastre a [categoria de estoque](/cadastros/estoque/categorias) e o [produto](/cadastros/estoque/produtos).
2. Registre a [entrada do material](/estoque/entrada-de-material), preferencialmente pela [nota fiscal de compra](/estoque/notas-fiscais-de-compra).
3. Crie uma [ordem de separação](/estoque/ordens-de-separacao) com almoxarifado, técnico e itens.
4. Para produto patrimonial, selecione cada equipamento disponível no estoque de origem.
5. Confirme a saída para reduzir o almoxarifado e aumentar o [estoque do funcionário](/estoque/estoque-por-funcionario).
6. Na [Agenda Técnica](/agenda-tecnica/agenda-tecnica), registre os itens usados ao concluir a OS.
7. O sistema reduz o saldo do técnico e registra o material como locado no serviço/contrato.
8. Devolva ao almoxarifado o que não foi utilizado; material retirado do cliente pode primeiro retornar à posse do técnico.

Para transferência entre almoxarifados, a ordem de separação gera uma [remessa de material](/estoque/remessa-de-material), não estoque de funcionário.

## Responsabilidade em cada etapa

| Estado | Onde consultar | Significado |
|---|---|---|
| Disponível | Almoxarifados / Controle patrimonial | Pode ser separado, vendido ou locado. |
| Reservado | Ordem de separação | Foi escolhido para uma ordem pendente e não deve ser usado em outra operação. |
| Em trânsito | Remessa de material | Saiu da origem e aguarda recebimento ou cancelamento no destino. |
| Com funcionário | Estoque por funcionário | Está sob responsabilidade da pessoa e pode ser aplicado em OS. |
| Locado | Contrato / Controle patrimonial | Foi instalado ou entregue ao cliente como material da empresa. |
| Vendido | Venda / Controle patrimonial | Saiu definitivamente pelo processo de venda. |

Patrimônios usam vínculos exclusivos: estoque, item de separação, remessa, funcionário, locação ou venda. A troca de etapa deve atualizar esse vínculo junto com as quantidades.

## Solicitações de material

O LHISP possui um módulo de solicitações para registrar uma demanda antes da separação. Uma solicitação pode conter produto específico ou categoria, quantidade e almoxarifado. As situações previstas são **Em aberto**, **Autorizada**, **Não autorizada** e **Cancelada**.

Pela regra do backend, somente uma solicitação em aberto pode ser autorizada ou cancelada. A autorização deveria criar, na mesma transação, uma ordem de separação do tipo transferência entre almoxarifados, copiar seus itens e vincular a ordem à solicitação.

### Limitações atuais da SPA

O código atual não oferece um fluxo confiável de criação/edição e autorização:

- o manipulador de salvar da página está comentado e o botão visível não chama a mutação existente;
- a permissão escolhida no backend está invertida: inclusão verifica `solicitacao_material_edit` e edição verifica `solicitacao_material_add`;
- a autorização envia `itens`, mas o serviço de ordem de separação exige `ItensOrdemSeparacao`, fazendo a criação ser recusada.

Até esses pontos serem corrigidos, não dependa de **Solicitações de material** para liberar itens. Use uma ordem de separação direta e confirme todo o percurso. Solicitações já existentes podem ser consultadas; o cancelamento de uma solicitação em aberto exige `solicitacao_material_del` e muda sua situação, sem gerar movimentação.

## Regras importantes

- Uma ordem não deve reservar mais que o saldo disponível no local.
- Produto patrimonial exige equipamentos específicos, não apenas quantidade.
- A confirmação da separação deve movimentar saldo, patrimônio e histórico na mesma transação.
- O técnico só pode aplicar em OS material que esteja em seu estoque.
- O consumo da OS cria ou atualiza a locação do contrato; não é simples baixa sem destino.
- A devolução deve indicar o almoxarifado e local físicos que receberam o item.
- Entrada ou ajuste avulso não substitui a correção de separação, OS ou devolução feita incorretamente.

## Conferência operacional

Antes de entregar:

- confira técnico, almoxarifado, produto, quantidade e séries;
- valide se o material físico corresponde aos itens reservados;
- confirme a saída somente quando houver entrega real.

Depois de entregar:

- confirme redução no almoxarifado;
- confirme aumento no estoque do funcionário;
- para itens controlados, confira a localização de cada patrimônio;
- guarde a ordem e o histórico como comprovante.

Depois da OS ou devolução:

- confirme a saída do estoque do técnico;
- valide locação no contrato ou retorno ao almoxarifado;
- investigue qualquer divergência antes de nova movimentação.

| Problema | Verificação |
|---|---|
| Técnico não recebe saldo | A ordem precisa ser do tipo entrega por OS e ter a saída confirmada. |
| Equipamento continua no almoxarifado | Confira se o patrimônio foi selecionado e se a confirmação concluiu sem erro. |
| OS recusa o material | Produto, quantidade e patrimônio devem estar no estoque do técnico responsável. |
| Saldo retornou, mas patrimônio não | Compare estoque do funcionário, estoque de destino e vínculo no Controle patrimonial. |
| Solicitação não salva ou não autoriza | É uma limitação atual do fluxo; crie a ordem de separação diretamente. |
