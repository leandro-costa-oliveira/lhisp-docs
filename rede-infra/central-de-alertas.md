---
title: Central de Alertas
published: true
editor: markdown
description: Acompanhamento de interfaces e métricas de servidores que ultrapassaram limites de monitoramento.
---

# Central de Alertas

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A Central de Alertas reúne gráficos de servidores que o daemon de monitoramento classificou como anormais. Ela serve para identificar rapidamente interface indisponível ou métrica fora dos limites configurados no gráfico; não substitui a investigação do equipamento, do enlace e do serviço afetado.

A mesma relação resumida aparece no painel lateral de monitoramento. Na central, os alertas são consolidados em uma lista e podem ser limpos em conjunto; no painel lateral, cada ocorrência também pode ser dispensada individualmente.

## Como o alerta é produzido

O daemon de gráficos coleta por SNMP os gráficos ativos dos servidores. O intervalo padrão de coleta é 60 segundos, embora possa ser alterado na implantação. Para gráficos de interface, ele acompanha contadores de entrada e saída e o estado operacional; para gráficos personalizados, consulta a OID e aplica o multiplicador configurado.

Quando **Enviar alertas** está habilitado no gráfico, uma mudança relevante publica um evento e grava o status e a mensagem no próprio gráfico:

| Status interno | Significado | Exibido na central |
|---|---|---|
| Normal/interface ativa | A métrica voltou à faixa ou a interface está operacional. | Não |
| Limite ultrapassado | Valor abaixo do mínimo ou acima do máximo configurado. | Sim |
| Interface inativa | O `ifOperStatus` deixou de indicar interface ativa ou não pôde ser obtido. | Sim |

A mensagem inclui servidor, IP, gráfico, direção e valor/limite quando aplicável. Se a empresa possuir token e chat do Telegram configurados, o serviço de notificações também encaminha o evento para esse canal.

## O que a tela mostra

A página consulta somente gráficos cujo status representa falha ou limite ultrapassado. Para cada item apresenta:

- identificador do gráfico;
- servidor associado;
- descrição do gráfico;
- hora exibida a partir da data gravada no registro do gráfico;
- texto do alerta mais recente armazenado.

A lista é atualizada automaticamente a cada 30 segundos. **Atualizar** força uma nova consulta, mas não força uma coleta SNMP nem reinicia o daemon.

## Tratar um alerta

1. Identifique servidor, gráfico e direção afetada na mensagem.
2. Abra o servidor e confira **Status ICMP**, **Status SSH**, interfaces, traps e o gráfico histórico.
3. Valide conectividade SNMP e o estado real da interface no equipamento.
4. Para alerta de limite, compare o valor com mínimo/máximo e verifique capacidade, erro de unidade ou multiplicador.
5. Corrija a causa e aguarde a coleta seguinte.
6. Limpe ou dispense o alerta somente depois de registrar e validar o tratamento.

Um alerta normalizado deixa de aparecer porque seu status não atende mais ao filtro da central. A normalização também pode gerar uma notificação informando o retorno à faixa esperada.

## Limpar alertas

**Limpar Alertas** pede confirmação e redefine para normal o status de **todos** os gráficos atualmente em alerta na empresa. A operação:

- não altera mínimo, máximo, OID ou configuração do gráfico;
- não reativa interface nem corrige SNMP;
- não apaga o histórico RRD;
- não remove o texto armazenado, apenas retira o item da consulta enquanto o status estiver normal.

Se a condição voltar a ser detectada em uma transição posterior, o daemon pode gerar novo alerta. Limpar em massa sem investigar pode esconder temporariamente incidentes de servidores diferentes.

No painel lateral de servidores, **Dispensar** executa a mesma redefinição para um único gráfico, respeitando a empresa do usuário. Prefira essa ação quando apenas uma ocorrência já foi tratada.

## Dependências

Para receber alertas confiáveis, confira:

- servidor e gráfico ativos;
- SNMP alcançável e comunidade/versão corretas;
- OID e índice da interface atuais;
- limites mínimo e máximo coerentes com a unidade coletada;
- **Enviar alertas** habilitado no gráfico;
- daemon de gráficos em execução;
- barramento de eventos e daemon de notificações ativos para Telegram;
- token e chat do Telegram configurados na empresa, quando esse canal for usado.

## Problemas comuns

| Sintoma | Verificação |
|---|---|
| Central vazia apesar de falha visível | Confira se o gráfico está ativo, envia alertas, possui OID válida e está sendo coletado pelo daemon. |
| Alerta de limite parece incorreto | Revise unidade, multiplicador e limites de entrada/saída do gráfico. |
| **Atualizar** não muda o valor | O botão apenas consulta o banco; aguarde a próxima coleta ou investigue o daemon/SNMP. |
| Alerta reapareceu depois da limpeza | A condição foi detectada novamente; trate a interface ou o limite em vez de apenas limpar. |
| Central mostra alerta, mas Telegram não recebe | Verifique token, chat, barramento e daemon de notificações. |
| Horário não coincide com o incidente | A coluna usa a data do registro do gráfico; use mensagem, gráfico histórico e logs para determinar a ocorrência. |

![Central de Alertas](/assets/screenshots/rede-infra/central-de-alertas.png)
