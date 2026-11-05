---
title: Planos dependentes
published: true
editor: markdown
description: Configure extras vinculados à internet e entenda associação, cobrança, bloqueio e desbloqueio do grupo, cancelamento e reativação.
---

# Planos dependentes

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

Planos dependentes permitem associar extras, como roteador e IP público, ao serviço principal do cliente. Com o vínculo, a dívida impeditiva de um extra também pode bloquear a internet. O desbloqueio financeiro automático exige que todo o grupo esteja regularizado.

## Como o vínculo funciona

O **plano** define se o produto é Principal ou Dependente e quais recursos exige do principal. O vínculo efetivo é entre os **serviços contratados** do cliente: por exemplo, o roteador contratado aponta para a internet contratada no mesmo contrato.

| Conceito | Regra |
|---|---|
| Principal | Serviço de plano Principal que atende aos requisitos do dependente. |
| Dependente | Serviço adicional vinculado a um único principal. |
| Grupo | Um principal e todos os dependentes vinculados a ele. Um principal pode ter vários dependentes, inclusive do mesmo plano. |
| Outro principal no mesmo contrato | Forma outro grupo. Suas dívidas não entram na avaliação deste grupo. |
| Serviço antigo sem vínculo | Aparece como **Sem principal associado**. Não participa de outro grupo até ser associado explicitamente. |

Os serviços precisam pertencer ao mesmo contrato e empresa. Não é permitido vincular um serviço a si próprio, usar outro dependente como principal ou formar cadeias de dependência.

Cada integrante conserva identificação, valor, cobrança e situação próprios. O vínculo não reúne mensalidades em um único serviço, não muda valores ou divisão fiscal e não altera as regras de agrupamento de boletos.

## Configurar os planos

1. Abra o [cadastro de planos](/cadastros/financeiro/planos).
2. No plano de internet, mantenha **Tipo de vínculo: Principal** e o recurso **Acesso** habilitado.
3. No plano do extra, abra **Serviços e acesso** e selecione **Tipo de vínculo: Dependente**.
4. Em **Requisitos do plano principal**, marque **Acesso** para exigir um principal de internet.
5. Revise as demais abas e salve.

É obrigatório marcar pelo menos um requisito. As opções são **Acesso**, **E-mail**, **Telefonia**, **OTT** e **Intelbras Mibo**. Quando houver várias marcadas, o mesmo principal precisa atender a todas; não basta atender a apenas uma.

O requisito Acesso verifica a capacidade do plano principal. Não exige acesso técnico cadastrado, conexão online ou protocolo específico. Os requisitos do principal não habilitam recursos no próprio extra.

Na versão atual, novas contratações dependentes ainda exigem **Acesso**. Configurações sem esse requisito dependem da validação das integrações correspondentes antes de serem disponibilizadas para contratação.

Salvar o plano não cria vínculos nos contratos existentes. Também não é permitido alterar tipo, requisitos ou capacidades de modo a invalidar vínculos já existentes.

## Contratar e consultar

Na [contratação de serviço](/contratos/adicionar-servico-contratado), selecione o plano dependente e escolha o **Serviço principal** entre os elegíveis do contrato. A escolha é obrigatória mesmo quando existe apenas um candidato. Um principal cancelado não pode receber um novo vínculo.

A ativação imediata do dependente exige que o principal esteja **ATIVO**. Uma contratação pendente pode aguardar a ativação do principal. Na troca para um plano dependente ou na reativação de um dependente antigo sem vínculo, também é necessário resolver o principal.

Na aba **Serviços**, o principal aparece seguido dos dependentes, com identificação textual da relação. Cada linha mantém valor, situação, permissões e ações próprias. Dependentes cancelados continuam consultáveis.

Um vínculo existente não deve ser tratado como campo de livre remoção ou substituição na edição/troca de plano. Se houver incompatibilidade, revise a configuração e os vínculos antes de prosseguir.

## Associar extras já existentes

A ferramenta permite vincular os serviços antigos sem recontratá-los:

1. Salve o plano dependente com os requisitos corretos.
2. Abra **Ferramentas > Vincular serviços contratados a um principal**.
3. Clique em **Visualizar alterações**.
4. Confira o contrato, o serviço, sua situação, os candidatos e o resultado de cada linha.
5. Revise o principal sugerido, marque os serviços desejados e clique em **Executar**.
6. Confira o resultado por item e avance com **Próxima página**, se necessário. Cada página apresenta até 100 serviços.

A sugestão inicial é o candidato elegível de menor ID. É possível aceitá-la ou escolher outro candidato; **Usar nos dependentes deste contrato** aplica a escolha aos dependentes elegíveis daquele contrato na prévia. Nenhum serviço vem marcado para execução: escolher o principal não grava o vínculo.

| Resultado da consulta/execução | Como proceder |
|---|---|
| Serviço disponível com candidato | Revise o principal e marque a linha para executar. |
| Nenhum candidato elegível | Confira tipo, recursos e situação do principal e os requisitos do extra. Corrija e consulte novamente. |
| **Já associado** | Não precisa executar novamente. Ative **Mostrar serviços já vinculados** para consultar essas linhas, ocultas por padrão. |
| Vínculo incompatível ou dados alterados | Não há substituição silenciosa. Revise o conflito e gere uma nova consulta. |
| Falha em um item | Confira o resultado dos demais; corrija a pendência e consulte novamente antes de tentar o item. |

A execução revalida os dados e grava somente os vínculos selecionados. Repetir o mesmo vínculo não duplica a associação. A prévia fica na tela; recarregar exige nova consulta.

**A associação preserva preço, vencimento, opções de cobrança e situação existentes.** Não bloqueia a internet, reativa serviços ou altera contas durante a execução. As próximas avaliações financeiras passam a considerar os integrantes vinculados, inclusive suas dívidas já existentes. Confira essas pendências antes de associar a base.

## Vencimento e opções de cobrança

Na nova contratação dependente, o sistema copia do principal o vencimento e as opções abaixo. Os campos ficam travados no dependente:

- Enviar boletos por e-mail.
- Enviar boletos por WhatsApp.
- Não efetuar bloqueio automático.
- Não efetuar cancelamento automático.
- Não enviar mensagens de cobrança.
- Cancelar contas automaticamente.
- Aceitar pagamentos por cartão.

Para mudar esses campos depois, edite o principal. A alteração é propagada aos dependentes vinculados, inclusive cancelados, sem reativá-los. A edição do principal pede confirmação quando há dependentes e mudança de campo herdado; cancelar a confirmação não envia a edição.

A mudança de vencimento também pode recalcular contas mensais abertas elegíveis e cancelar/reemitir boletos registrados, conforme o fluxo financeiro existente. O diálogo avisa sobre esses efeitos.

A associação de serviços antigos preserva as configurações anteriores. Abrir ou salvar o principal sem alterar um campo não sincroniza divergências antigas. Uma alteração futura explícita propaga o campo alterado; opções fiscais, preço e parâmetros técnicos não são herdados por essa regra.

## Bloqueio automático por inadimplência

A rotina financeira considera a dívida dos integrantes vinculados. Se uma conta atingir o critério de bloqueio aplicável, o sistema resolve o principal e bloqueia os integrantes **ATIVOS** do grupo pelos fluxos existentes, incluindo o acesso de internet do principal.

- A dívida pode ser do principal ou de qualquer dependente, mesmo que o extra não tenha acesso técnico próprio.
- Dívida válida de dependente cancelado também pode disparar o bloqueio dos integrantes ativos.
- Serviços já bloqueados não repetem os efeitos. Cancelados, suspensos, pendentes e desativados conservam suas situações.
- O principal precisa estar ativo ou bloqueado para a operação financeira do grupo. Ela não ativa um principal cancelado ou suspenso.
- Permanecem os prazos, prorrogações, feriados e critérios próprios dos fluxos pré-pago/pós-pago. Nem toda conta vencida já é impeditiva para corte.

A opção **Não efetuar bloqueio automático** é consultada no **serviço devedor**. Se ele estiver isento, sua dívida não dispara essa cascata, inclusive após seu cancelamento. A isenção de um integrante não impede bloqueio disparado pela dívida de outro integrante não isento. Serviços antigos associados podem conservar opções diferentes, pois a associação não sincroniza configurações retroativamente.

## Desbloqueio automático após regularização

Quando um pagamento ou outra regularização aciona a avaliação financeira, o sistema verifica as contas de **todos** os integrantes do grupo. Pagar o extra ou o principal leva à avaliação do mesmo grupo.

| Situação | Resultado |
|---|---|
| Resta dívida impeditiva em qualquer integrante | Nenhum integrante recebe desbloqueio financeiro automático. |
| Pagamento parcial ainda deixa dívida impeditiva | O grupo permanece bloqueado. |
| Todas as pendências impeditivas regularizadas | Desbloqueia os integrantes **BLOQUEADOS** pelo fluxo do principal. |
| Principal já ativo e dependente bloqueado | O dependente pode ser liberado se todo o grupo estiver regularizado. |
| Dependente cancelado com dívida | A conta participa da avaliação; pagá-la não reativa o cancelado. |
| Principal cancelado ou suspenso | Pagamento não o reativa nem libera automaticamente os dependentes. |
| Outro grupo do mesmo contrato com dívida | Não impede a liberação deste grupo. |

As entradas financeiras preservam seus critérios e prazos próprios. Não prometa liberação imediata apenas pela data do pagamento: confira a baixa/compensação e as contas consideradas pelo fluxo.

**O estado BLOQUEADO não distingue a causa nesse processo.** Um bloqueio registrado apenas nessa situação, inclusive manual, pode ser removido pela regularização automática do grupo. Não há retenção adicional baseada na origem financeira, manual ou judicial do bloqueio genérico.

### Exemplo: internet, roteador e IP público

| Etapa | Resultado esperado |
|---|---|
| Internet paga; roteador atinge critério de corte | Internet, roteador e IP público ativos são bloqueados. |
| Roteador pago, mas IP público ainda tem dívida impeditiva | O grupo permanece bloqueado. |
| Última dívida impeditiva regularizada | Os integrantes bloqueados são liberados. |
| Roteador estava cancelado com dívida | A dívida continua na avaliação; sua quitação não reativa o roteador. |

O mesmo comportamento vale para um principal com cinco ou mais dependentes: basta uma dívida impeditiva para reter a liberação automática do grupo.

## Desbloqueio em confiança

A confiança mantém os limites de uso, o prazo e o histórico existentes. A solicitação é feita no **principal**; dependentes não recebem confiança individual.

A confiança dispensa somente a pendência financeira do principal solicitado. Os demais integrantes precisam estar sem dívida impeditiva. Portanto, conceder confiança à internet não ignora automaticamente a dívida de um roteador vinculado. Uma recusa não consome a cota de confiança. A operação não reativa cancelados ou suspensos.

## Cancelamento e reativação

| Operação | Efeito no grupo |
|---|---|
| Cancelar o principal | Cancela também os dependentes vinculados ainda não cancelados, pelos fluxos existentes. |
| Cancelar um dependente individualmente | Não cancela o principal ou os demais dependentes. |
| Reativar o principal | Reativa somente os dependentes cancelados pela cascata do principal, revalidando as regras existentes. |
| Dependente cancelado individualmente antes do principal | Permanece cancelado quando o principal é reativado. |
| Ativar, reativar ou retornar um dependente de suspensão | Exige que o principal esteja **ATIVO** e que as demais regras da operação sejam atendidas. |
| Pagar conta de serviço cancelado | Regulariza a conta; não reativa o serviço por pagamento. |

O sistema identifica os cancelamentos feitos pela cascata. A origem é limpa após reativação concluída; falhas precisam ser verificadas no resultado e no histórico de cada serviço.

**Cancelar o extra não cancela a internet.** Se houver dívida impeditiva do extra cancelado, ela continua podendo bloquear ou impedir a liberação financeira do grupo. Cancelamento comercial e suspensão a pedido não equivalem a inadimplência.

Bloqueio, desbloqueio e suspensão individuais são operações do principal; não há comando individual correspondente para o dependente. As regras de cascata financeira descritas neste guia se referem aos fluxos de inadimplência e regularização, não a toda ação manual de bloqueio/suspensão.

## Conferência e diagnóstico

| Dúvida ou ocorrência | O que conferir |
|---|---|
| Extra inadimplente não bloqueou a internet | Vínculo efetivo, principal correto, critério/prazo de corte, isenção do devedor e execução da rotina financeira. Apenas mudar o tipo do plano não associa serviços antigos. |
| Pagamento feito e grupo ainda bloqueado | Baixa confirmada e contas impeditivas de todos os integrantes, incluindo dependentes cancelados. |
| Extra não aparece como dependente | Configuração do plano e vínculo do serviço contratado; consulte a aba **Serviços**. |
| Não há principal para escolher | Mesmo contrato/empresa, tipo Principal, requisitos atendidos e principal não cancelado. |
| Configuração de cobrança antiga diferente | A associação preserva valores e opções anteriores; confira mudanças explícitas posteriores no principal. |
| Falha parcial de bloqueio, desbloqueio ou reativação | Resultado da operação, situação e histórico de cada integrante e estado real nas integrações de acesso/OTT/telefonia. |

A condição financeira é comum ao grupo, mas os efeitos em equipamentos e integrações podem falhar parcialmente. Não considere a operação concluída para todos apenas porque uma linha mudou de situação. Corrija a falha pelo fluxo operacional existente e confira novamente os integrantes.

Veja também: [Cadastro de planos](/cadastros/financeiro/planos), [Adicionar serviço contratado](/contratos/adicionar-servico-contratado) e [Acesso do cliente](/contratos/adicionar-acesso-cliente).
