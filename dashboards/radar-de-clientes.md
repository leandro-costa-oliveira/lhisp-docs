---
title: Radar de Clientes
published: true
editor: markdown
description: Consulte cancelamentos efetivos, interprete a cobertura do histórico e acompanhe simulações de risco e cargas históricas.
---

# Radar de Clientes

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O Radar de Clientes reúne consulta de cancelamentos, ranking de simulações, diagnóstico por contrato e acompanhamento da saúde dos dados. O módulo precisa estar habilitado para a empresa; as telas respeitam permissões, acesso a contratos e filiais autorizadas.

## Telas e acesso

| Tela | Rota e condição |
|---|---|
| **Visão básica** | `/radar-clientes/visao-basica`; exige `radar_clientes_basico_cons` e acesso a Contratos. |
| **Ranking** | `/radar-clientes/ranking`; exige `radar_clientes_premium_cons`, acesso a Contratos e assinatura verificada ativa. |
| **Diagnóstico** | `/radar-clientes/contratos/:id?execucaoId=...`; aberto a partir de um item do ranking. |
| **Assinatura** | `/radar-clientes/assinatura`; apresenta disponibilidade e condições de contratação ao administrador. |
| **Saúde dos dados** | `/radar-clientes/configuracoes`; administração/master e `radar_clientes_config_cons` para consultar; `radar_clientes_config_ger` para gerenciar. |
| **Ajuda e vídeos** | `/radar-clientes/ajuda`; tutoriais e transcrições disponíveis na instalação. |

O acesso ao financeiro do ranking e do diagnóstico depende de `view_tab_contas_receber`. A falta dessa permissão remove informações e filtros financeiros da consulta apresentada.

## Cancelamentos na visão básica

O indicador conta **contratos distintos com cancelamento efetivo**, com total separado de eventos. Um contrato com mais de um evento pode aumentar o total de eventos sem aumentar o total de contratos na mesma janela. O relatório também apresenta série mensal e comparação com o intervalo anterior de mesma duração.

1. Abra **Visão básica**.
2. Informe início e **fim exclusivo**, com intervalo de até 12 meses civis.
3. Se necessário, selecione **Filial atual** e/ou **Filial do evento**.
4. Clique em **Consultar**.
5. Confira a cobertura antes de interpretar o total.
6. Abra os eventos de cada contrato na tabela; a paginação usa 25 contratos.

**Fim exclusivo** significa que o dia final não entra no intervalo. Para consultar todo setembro, por exemplo, escolha início `01/09` e fim `01/10`. O painel informa o fuso utilizado na apuração; os instantes dos eventos são apresentados nesse fuso.

**Filial atual** consulta a associação atual do contrato. **Filial do evento** usa a filial comprovada quando o cancelamento ocorreu. As duas podem diferir após uma transferência. Um evento sem filial comprovada é identificado assim na tabela.

Sem período na URL, a consulta usa os 30 dias anteriores ao início do dia atual. O cartão da dashboard principal usa esse mesmo recorte e oferece oito semanas completas com atalhos para consulta.

### Cobertura insuficiente

Quando o histórico não sustenta a janela escolhida, a tela apresenta **Histórico insuficiente** e deixa os totais indisponíveis. Isso não equivale a zero cancelamentos. A comparação também pode ficar indisponível se o período anterior não tiver cobertura; percentual sem base anterior não deve ser interpretado como zero.

Confira a janela e a saúde das fontes. Uma carga histórica concluída não comprova, sozinha, cobertura de todos os sinais ou de todos os períodos. A própria consulta informa se a cobertura de cancelamentos está pronta.

## Ranking e diagnóstico de simulação

O ranking consulta execuções **já concluídas e visíveis**. Escolha uma execução e aplique contrato, faixa e intervalo de score de 0 a 100. Quando autorizado, também é possível filtrar MRR mínimo/máximo, informado com duas casas decimais.

Os resultados mostram posição, contrato, score, faixa e cobertura. A ordenação usa score decrescente e, quando o financeiro está disponível, MRR decrescente; o ID do contrato desempata. A consulta carrega até 50 itens por página.

O diagnóstico mostra o corte da execução, perfil e versões, score base/final, multiplicador, cobertura e estado dos sinais. Os estados podem indicar disponibilidade, indisponibilidade, não aplicação ou histórico insuficiente.

**Score é um índice de simulação.** Cobertura insuficiente torna o resultado provisório e não indica risco baixo, elegibilidade ou ação automática. Abrir ranking ou diagnóstico não gera campanha, bloqueio ou alteração no contrato.

Se não houver execução concluída e visível, a tela informa essa condição. Se a consulta mudar durante a paginação, reinicie-a conforme a mensagem do sistema.

## Saúde dos dados e carga histórica

A tela mostra fontes, estados, última atualização, cobertura publicada, checkpoint, execuções, quantidades processadas e eventuais erros. Os horários dessa tela são apresentados em **UTC**, com o fim da cobertura exclusivo.

Com assinatura ativa e permissão de gestão, o administrador pode:

- habilitar ou desabilitar o processamento, confirmando a alteração;
- solicitar uma janela de carga histórica;
- reprocessar a janela do pedido anterior;
- liberar para retomada um pedido pausado.

**Solicitar ou retomar registra o pedido; a operação técnica executa a carga manualmente.** A tela não inicia um processamento completo por conta própria. Informe a janela em UTC, com fim exclusivo anterior ao momento atual e duração máxima de 366 dias. A janela deve conter toda a cobertura já publicada; o sistema recusa reduzi-la.

Desabilitar o processamento interrompe a autorização de novos lotes. Para acompanhar o resultado, confira o pedido e cada fonte e depois valide a cobertura na visão básica.

| Situação | Verificação |
|---|---|
| A rota volta para a dashboard | Confira se o Radar está habilitado para a empresa. |
| Acesso negado | Revise permissão específica, acesso a Contratos, filiais e assinatura quando exigida. |
| Total indisponível | Confira cobertura e janela; ausência de cobertura não é total zero. |
| MRR não aparece | Confira permissão financeira e disponibilidade do dado na execução. |
| Pedido continua pendente | A carga exige execução manual pela operação técnica. |
| Nova janela recusada | Amplie-a para conter a cobertura já publicada. |

Veja também [Contratos](/contratos/contrato) e [Ativações / Cancelamentos](/relatorios/ativacoes-cancelamentos).
