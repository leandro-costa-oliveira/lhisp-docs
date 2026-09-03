---
title: Bloqueios por atraso
published: true
editor: markdown
description: Audite títulos vencidos e bloqueie ou desbloqueie em lote os serviços associados.
---

# Bloqueios por atraso

Esta rotina relaciona inadimplência financeira ao estado operacional do serviço contratado. Ela procura contas a receber em aberto que atingiram o limite de atraso da empresa e permite bloquear serviços ativos ou desbloquear serviços já bloqueados.

O bloqueio não cancela nem baixa a dívida. Ele muda a situação do serviço, atualiza a situação do contrato, bloqueia os acessos de rede associados e propaga a ação para OTT e telefonia vinculados. O desbloqueio faz o caminho operacional inverso e registra ambas as ações no histórico do serviço.

## Antes da ação em lote

- Use **Visualizar** com os mesmos filtros da ação.
- Confira pagamentos e retornos bancários ainda pendentes de processamento.
- Revise títulos prorrogados: os dias de atraso consideram a prorrogação, quando existe.
- Identifique exceções comerciais. Serviços marcados para não sofrer bloqueio automático também são excluídos desta tela.
- Garanta comunicação com os servidores de acesso e integrações relacionadas.

## Critérios da listagem

A tela considera somente contas a receber em aberto cuja quantidade de dias vencidos seja maior ou igual a **Dias para corte** configurado na empresa. Se esse valor não estiver disponível, a consulta usa o prazo de cobrança da empresa.

Também são aplicadas estas regras:

- **Filial** em branco inclui todas; uma filial selecionada restringe os contratos.
- O intervalo informado filtra o vencimento original do título.
- **Dias de atraso** é calculado até hoje usando a data de prorrogação, se houver, ou o vencimento original.
- Apenas serviços em situação **ATIVO** ou **BLOQUEADO** são exibidos.
- Serviços com **Não bloquear automaticamente** são ignorados.
- Um serviço desbloqueado recentemente fica fora da lista durante o número de dias de tolerância pós-desbloqueio configurado na empresa.

A tabela apresenta uma linha por título elegível. O mesmo contrato ou serviço pode aparecer mais de uma vez quando possui várias contas vencidas.

## Executar

1. Se necessário, escolha a filial e informe o intervalo de vencimentos.
2. Clique em **Visualizar**.
3. Confira contrato, cliente, plano, vencimento, dias de atraso, valor e situação.
4. Para bloquear, clique em **Efetuar Bloqueios** e confirme. Todos os serviços ativos exibidos pelos filtros serão processados.
5. Para desbloquear, clique em **Efetuar Desbloqueios** e confirme. Todos os serviços bloqueados exibidos serão processados.
6. Revise a situação mostrada na tabela e o resumo do rodapé.

Não há seleção individual por linha. Os botões atuam sobre todo o resultado dos filtros. Para tratar uma única exceção, use o serviço dentro do contrato.

## Permissões e efeitos

- **Efetuar Bloqueios** exige `contrato_bloq_servico`.
- **Efetuar Desbloqueios** exige `contrato_desbloq_servico`.
- Sem a permissão correspondente, o botão fica desabilitado e o backend não executa a mudança.
- Bloqueios feitos aqui usam o motivo **PAGAMENTO EM ATRASO**.
- Desbloqueios feitos aqui usam o motivo **DESBLOQUEIO EM LOTE**.
- O desbloqueio também remove mensagens de bloqueio pendentes do acesso e restaura velocidades que haviam sido reduzidas, quando houver valores preservados.

Desbloquear não altera a conta a receber. Se a dívida continuar aberta, o serviço volta a ser elegível depois da tolerância pós-desbloqueio.

## Relação com a automação financeira

O daemon financeiro também pode bloquear serviços pós-pagos quando **Bloqueio automático** está habilitado e **Dias para corte** é maior que zero. Essa automação não executa cobranças nem bloqueios aos sábados e domingos e pula feriados no momento do bloqueio. Serviços pré-pagos possuem tratamento próprio: podem ser bloqueados após o vencimento da conta.

A tela manual usa os filtros e confirmações do operador; não depende de ser dia útil. Portanto, não a utilize como simples “prévia” da próxima execução automática sem considerar essas diferenças.

## Diagnóstico

| Situação | Verificação |
|---|---|
| Título vencido não aparece | Confira situação da conta, dias para corte, prorrogação, intervalo e opção **Não bloquear automaticamente** do serviço. |
| Botão está desabilitado | Falta a permissão específica de bloqueio ou desbloqueio. |
| Contrato aparece repetido | Existem vários títulos vencidos; a listagem não agrupa por contrato. |
| Serviço desbloqueado não aparece | Pode estar dentro da tolerância configurada após o último desbloqueio. |
| Serviço foi desbloqueado e bloqueou novamente depois | A dívida permaneceu aberta e terminou a tolerância pós-desbloqueio. |
| Situação mudou, mas o cliente continua com acesso | Verifique o vínculo do acesso ao serviço, comunicação com o servidor e histórico operacional. |

![Tela Bloqueios por atraso](/assets/screenshots/financeiro/bloqueios-por-atraso.png)
