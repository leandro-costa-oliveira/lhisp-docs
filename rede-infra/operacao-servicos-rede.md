---
title: Operação dos serviços de rede
published: true
editor: markdown
description: Dependências e diagnóstico de filas Mikrotik, monitoramento, gráficos, syslog, RADIUS e TR-069.
---

# Operação dos serviços de rede

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

Salvar um cadastro e aplicar sua configuração são etapas diferentes. O LHISP utiliza serviços separados para executar comandos, monitorar equipamentos, coletar gráficos e registrar sessões. Este guia ajuda a localizar a etapa que falhou antes de repetir uma operação.

Os nomes abaixo identificam repositórios e responsabilidades. Nomes de containers, hosts, volumes e portas publicados dependem da implantação; confirme-os no ambiente autorizado antes de qualquer intervenção.

## Qual serviço investigar

| Sintoma | Serviço / dependências |
|---|---|
| Configuração Mikrotik continua pendente | `lhisp-daemon-mikrotik`: RabbitMQ, banco do tenant e SSH até o equipamento/gateway. |
| Status ICMP desatualizado | `lhisp-daemon-netmon`: cadastro, `fping`, caminho de rede e callbacks dos dependentes. |
| Gráfico sem dados recentes | `lhisp-daemon-graficos`: SNMP, índices/OIDs, banco e arquivos RRD. |
| Alerta aparece, mas Telegram não recebe | `lhisp-daemon-notificacoes`: evento, integração Telegram e configuração da empresa. |
| Sessões PPPoE não aparecem a partir de syslog | `lhisp-rsyslog` recebe UDP e grava `SystemEvents`; `lhisp-daemon-syslog` interpreta e remove os eventos processados. |
| Autenticação ou accounting RADIUS falha | `lhisp-radius`: FreeRADIUS, SQL, cadastro do NAS e comunicação com o concentrador. |
| CPE não provisiona pelo ACS | `lhisp-daemon-tr069`: HTTP/CWMP, contexto do tenant, módulo ativo, MAC e modelo de dados da CPE. |

## Fila Mikrotik

O cadastro gera registros em `MIKROTIKACTION`. Um evento na exchange padrão **ServidorComandos** solicita processamento pela fila RabbitMQ padrão **LHISPDaemonMikrotik**. A fila RabbitMQ transporta o aviso; os comandos ficam no banco. Um broker sem mensagens pendentes não comprova que `MIKROTIKACTION` foi drenada.

O executor carrega comandos por ID crescente, em lotes de 200 por padrão, e continua enquanto houver trabalho. Para **Conectar por**, usa o IP do gateway e a porta derivada do ID do servidor (`ID + 9000`); sem gateway, usa IP e porta SSH cadastrados.

| Parâmetro | Padrão no código | Finalidade |
|---|---|---|
| `MIKROTIK_BATCH_SIZE` | `200` | Comandos buscados em cada lote. |
| `SSH_CONNECT_TIMEOUT` | `60000` ms | Espera de conexão SSH. |
| `SSH_EXEC_TIMEOUT` | `60000` ms | Espera de um comando. |
| `MIKROTIK_IDLE_TIMEOUT` | `300000` ms | Inatividade sem progresso antes de abortar o processamento. |
| `MIKROTIK_MAX_TENTATIVAS` | `5` | Limite de retransmissões consecutivas sem progresso. |
| `MIKROTIK_RETRANSMIT_DELAY` | `5000` ms | Base da espera entre retransmissões, multiplicada pela tentativa. |

Depois de um erro de transporte, o comando pode permanecer pendente e ser tentado novamente. Se o equipamento recebeu a alteração e a resposta se perdeu, a repetição pode reaplicá-la. A rotina não oferece garantia de execução exatamente uma vez.

Após uma resposta SSH sem exceção, o executor registra o resultado e remove o comando do banco. Ele não valida semanticamente todas as mensagens da CLI: fila vazia ou SSH online não comprovam configuração aceita pelo RouterOS.

Para investigar:

1. Identifique tenant, empresa, ID do servidor e horário com fuso.
2. Confira **Status SSH**, mensagem e caminho **Conectar por** no cadastro.
3. Compare quantidade de comandos pendentes ao longo do tempo e logs do executor para o mesmo servidor.
4. Verifique conexão RabbitMQ, exchange/fila efetivamente configuradas e recebimento do evento.
5. Se aparecer **Desistindo do servidor ... após ... tentativas sem progresso**, corrija conectividade/credenciais antes de solicitar nova aplicação pelo fluxo do cadastro.
6. Compare a configuração real antes de reenviar comandos que possam ter sido executados parcialmente.

Não use **Limpar Comandos da Fila** como tratamento de falha: ela descarta trabalho pendente. A ferramenta [Enviar Comandos](/rede-infra/enviar-comandos) usa execução direta por SSH e possui outro comportamento.

## Monitoramento ICMP e dependentes

O netmon cria workers por empresa ativa e carrega inicialmente servidores sem gateway. O ciclo busca aproximadamente 60 segundos entre inícios, com espera mínima de um segundo se exceder esse tempo. O estado muda depois de três respostas consecutivas positivas ou negativas; não é um teste instantâneo.

Quando um gateway cai, seus dependentes são marcados offline. No retorno de um gateway Mikrotik, o daemon enfileira o rearme dos netwatches identificados por `lhnetwatch-`, para que os próprios callbacks atualizem os dependentes. Na inicialização também verifica gateways online com dependentes ainda offline.

Se o gateway voltou e os dependentes continuam offline, examine a fila SSH do gateway, os netwatches e os callbacks. Um ping feito do navegador/servidor LHISP pode percorrer um caminho diferente do teste feito pelo gateway. A opção **Enviar Alertas** controla a notificação, não substitui a coleta nem a atualização do status.

## Gráficos e alertas

Confira SNMP, comunidade/versão, índice da interface, OID e última atualização do arquivo RRD. O padrão de coleta é 60 segundos; o passo RRD e heartbeat padrão são 300 segundos. Se o ciclo alongar além do heartbeat, aparecem lacunas mesmo que a página continue atualizando imagens.

`RRD_AUTO_TUNE` vem desativado. Ajustar o heartbeat em variáveis de ambiente não garante a alteração dos arquivos existentes. Registre duração dos ciclos e falhas SNMP antes de mudar frequência, concorrência ou retenção.

Para limites e notificações, consulte [Central de Alertas](/rede-infra/central-de-alertas). Para painéis, consulte [Monitor de Gráficos](/rede-infra/monitoramento-de-graficos).

## Syslog e histórico PPPoE

O receptor `lhisp-rsyslog` gera listeners UDP por base. A porta pode vir de `SyslogPort` na configuração de tenants; na ausência dela, o código distribui portas a partir de 10514. Use a porta efetiva da implantação, não uma porta deduzida pela ordem dos tenants.

O receptor grava somente mensagens com a tag **pppoe,ppp,info,account**. O consumidor busca até 100 eventos por vez em `SystemEvents`, interpreta o marcador de empresa/servidor `|#|:` e remove os registros tratados. Mensagens sem esse marcador também são retiradas após registro como desconhecidas.

`SystemEvents` funciona como fila intermediária, não como arquivo permanente de auditoria. Para investigar ausência de sessões, confira, nesta ordem:

1. destino e porta UDP configurados no concentrador;
2. entrega até o receptor e tag da mensagem;
3. chegada dos registros na base correta;
4. execução do consumidor, incluindo `desativarSyslogDaemon` do tenant;
5. formato da mensagem, identificação do servidor e histórico de sessão resultante.

A API `/log` do receptor rsyslog não está implementada. Não a confunda com a API de log do serviço RADIUS.

## RADIUS

O FreeRADIUS usa as tabelas do LHISP para autenticação e accounting. A lista de NAS vem de servidores não apagados cuja empresa tem daemons habilitados. Ela é carregada na inicialização do serviço: mudar IP ou segredo exige confirmar que a recarga solicitada pelo cadastro terminou.

Compare o IP cadastrado do servidor com o **NAS-IP-Address** enviado pelo concentrador. Um NAS conhecido para transporte pode anunciar um endereço diferente na requisição e não encontrar o acesso na consulta SQL. Confira também segredo, vínculo à rede/serviço, situação do serviço e trava de MAC.

O accounting atualiza `HISTORICOACESSO` e o estado online do acesso. Autenticação bem-sucedida com histórico ausente exige verificar accounting separadamente. Eventos `accounting-on/off` encerram sessões daquele NAS, portanto um encerramento coletivo pode estar associado ao reinício do concentrador.

A senha de acesso administrativo aos equipamentos é uma credencial própria do usuário do LHISP. Ela não é a senha de login no sistema nem a senha PPPoE do assinante. Ausência da credencial de equipamentos ou da chave de cifra do tenant pode impedir o acesso administrativo sem impedir a autenticação dos assinantes.

O supervisor verifica o processo FreeRADIUS a cada 30 segundos e tenta reiniciá-lo quando ausente. O container pode permanecer em execução enquanto o `radiusd` falha repetidamente: confira os logs do processo. O log é truncado periodicamente, por padrão a cada 30 minutos; ausência de tentativa antiga não prova que ela nunca ocorreu.

O serviço HTTP auxiliar usa `HTTP_PORT`, padrão **4030**, e oferece `/restart` e `/log`. Esses endpoints não possuem autenticação própria no serviço e devem ficar na rede interna prevista pela implantação. O botão de cadastro usa a integração existente; não publique essas rotas como API para assinantes.

## TR-069

Separe três estados: setup da rede aplicado, CPE comunicando com o ACS e parâmetros aceitos pela CPE. Um estado não comprova os demais. O healthcheck do ACS (`/health` ou `/tr069/health`) indica que o HTTP responde; ele não testa banco, módulo, RabbitMQ ou comunicação com uma CPE.

Callbacks dependem do barramento para atualizar o inventário/status. Se a publicação falhar, o daemon registra o erro e não derruba a sessão CWMP; a CPE pode ter sido provisionada e a tela continuar desatualizada. Confira o horário e a mensagem antes de reaplicar.

Consulte [Compatibilidade TR-069](/rede-infra/tr069-outros-fabricantes) para MAC, modelos TR-098/TR-181 e o caso **PROVISIONADO** somente como inventário.

## Evidências e limites

Em chamados, registre identificação do tenant/servidor, horário, ação solicitada, etapa atingida e mensagem sanitizada. Os logs do executor podem conter comandos e dados do equipamento: remova senhas, segredos RADIUS/SNMP e informações dos clientes antes de compartilhá-los.

Este guia foi confrontado com fontes locais. Ele não certifica versões implantadas, topologia, entrega de rede, restauração de backups ou homologação de fabricantes. Esses pontos exigem validação no ambiente autorizado e registro próprio de operação.
