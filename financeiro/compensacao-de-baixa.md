---
title: Compensação de baixa
published: true
editor: markdown
description: Use o pagamento de uma cobrança posterior para quitar uma anterior do mesmo contrato, com reposição da cobrança original.
---

# Compensação de baixa

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

Use **Compensar baixa** quando o cliente pagou uma cobrança posterior e deixou uma cobrança anterior em aberto. A operação vincula os títulos e cria outra conta em aberto para repor a cobrança cujo pagamento foi utilizado.

Exemplo: outubro está em aberto e novembro foi pago, ambos com valor nominal de R$ 100. Ao compensar novembro para outubro, outubro fica quitado, novembro continua registrado como pago e surge uma reposição de R$ 100 com o vencimento e os dados originais de novembro. O dinheiro recebido permanece registrado uma única vez.

## Requisitos

- usuário autenticado no painel, com a permissão `contrato_compensar_baixa` ou perfil administrativo que a conceda;
- acesso à filial e às contas bancárias dos dois títulos;
- origem paga e destino em aberto, pertencentes ao mesmo contrato e à mesma filial/empresa;
- valores nominais iguais, com vencimento do destino anterior ao da origem;
- motivo preenchido, com até 160 caracteres.

A comparação usa o **valor nominal**, não o saldo, o valor efetivamente recebido ou o valor com multa, juros e desconto. Confira esses dados nos detalhes antes de confirmar. A lista pode incluir contas de serviços ou tipos diferentes do mesmo contrato; o sistema revalida a seleção na execução.

## Operar

1. Abra o contrato e sua aba **Financeiro**.
2. Na cobrança paga, abra as ações e escolha **Compensar baixa**.
3. Escolha a cobrança anterior a quitar e confira número, vencimento e valor.
4. Leia o aviso sobre a criação da reposição e informe o motivo.
5. Clique em **Confirmar compensação**.
6. Anote o número da reposição e confira o histórico e o status dos três títulos.

Se não houver destino elegível, o diálogo informa **Nenhuma mensalidade anterior elegível para compensação**. Verifique contrato, situação, valor nominal, vencimento e acesso às contas bancárias.

## Efeito financeiro

| Registro | Resultado |
|---|---|
| **Origem paga** | Preserva o pagamento e recebe o vínculo com a conta quitada. |
| **Destino anterior** | Fica pago por compensação, com recebimento zero e a data de pagamento da origem. |
| **Reposição** | Nova conta em aberto, com novo número de documento, vencimento e parâmetros da origem. |
| **Histórico** | Os três títulos registram a operação e seus vínculos; origem e destino também registram o motivo. |

A confirmação financeira e a confirmação bancária são etapas diferentes. Se o destino estava registrado, o sistema solicita sua baixa no banco. O registro da reposição também é solicitado pela integração. Até a confirmação, a tela pode mostrar **Baixa bancária pendente** ou **Emissão bancária pendente**.

Falha na fila ou no banco pode deixar a compensação financeira concluída com integração pendente. Confira os históricos e encaminhe a pendência ao suporte; o ciclo financeiro possui retomada dessas solicitações. Na implementação atual, Unicred e ModoBank não implementam a baixa usada por esse fluxo, portanto podem permanecer pendentes nessa etapa.

Depois da gravação, o sistema reavalia desbloqueio/redução do serviço associado ao destino quando o bloqueio foi por atraso e não há outras contas atrasadas daquele serviço. A compensação não garante desbloqueio imediato.

## Conferência e correções

- A aba financeira identifica origem, destino e reposição e permite abrir a conta relacionada.
- Repetir a mesma solicitação já registrada retorna a reposição existente, sem criar outra compensação.
- Origem e destino vinculados possuem proteções contra operações isoladas de alteração, exclusão e estorno. Encaminhe uma correção ao suporte com os três identificadores.
- A reposição pode ser cancelada. Uma nova geração de carnê para aquela competência pode recriá-la com os dados originais, se não houver outra cobrança válida do mês; o cancelamento não desfaz a compensação.

Consulte também [Gerência Financeira](/financeiro/gerencia-financeira) e [Gerar carnês](/financeiro/gerar-carnes).
