---
title: Configurações Globais da Rede
published: true
editor: markdown
description: Parâmetros compartilhados de DNS, burst, scripts PPPoE e perímetro de gerência aplicados aos Mikrotiks da empresa.
---

# Configurações Globais da Rede

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

Esta tela concentra parâmetros usados pelo gerador de configuração de rede da empresa. As alterações não ficam restritas ao formulário: ao salvar, o backend percorre todos os servidores **Mikrotik**, recria regras de entrada, atualiza DNS e, quando necessário, recalcula perfis de velocidade ou scripts PPPoE.

Por esse alcance, trate a edição como mudança de infraestrutura. Um valor incorreto pode afetar resolução de nomes, acesso administrativo e sessões de muitos clientes ao mesmo tempo.

## Servidores DNS

Os quatro campos formam a lista global enviada aos Mikrotiks. O primeiro DNS é obrigatório para salvar; os demais só entram no comando quando contêm um IPv4 ou IPv6 válido.

Em cada servidor, o LHISP executa a configuração de `/ip dns` com essa lista, cache de 20.480 KiB e `allow-remote-requests` conforme a opção **Servidor de DNS** do cadastro daquele equipamento. Assim, a mesma lista pode ser usada apenas pelo próprio roteador ou também para atender consultas remotas, dependendo do servidor.

O atalho **Bloqueio Judicial** leva ao cadastro de domínios que devem ser tratados pela rotina específica de DNS. Ele é um processo separado: alterar os resolvedores globais não cadastra nem remove bloqueios judiciais. Consulte [DNS — Bloqueio Judicial](/rede-infra/dns-bloqueio-judicial).

## Multiplicadores de burst

**Burst Limit** e **Burst Threshold** são fatores aplicados às velocidades de upload e download dos acessos Mikrotik com burst habilitado:

- `burst-limit = velocidade × BURST_LIMIT_MULT`;
- `burst-threshold = velocidade × BURST_THREST_MULT`;
- o tempo de burst gerado é 16 segundos para upload e download.

Os valores padrão criados pelo sistema quando ainda não existe configuração são `2,0` para limite e `0,5` para threshold. Eles são apenas valores iniciais; ajuste conforme a política de banda da empresa.

Se o multiplicador de limite mudar, o backend percorre os acessos de cada Mikrotik, recria a configuração de velocidade e solicita a desconexão para que o novo perfil seja aplicado. Isso pode derrubar e reconectar muitas sessões. A rotina compara diretamente apenas o multiplicador de limite para decidir essa atualização em massa; portanto, valide também no equipamento o efeito de uma alteração isolada do threshold.

## Scripts PPPoE

**Script PPPoE UP** e **Script PPPoE Down** são trechos personalizados aplicados ao `on-up` e `on-down` dos perfis PPPoE gerenciados pelo LHISP. Ao detectar mudança em qualquer um deles, o backend enfileira em cada Mikrotik um comando que atualiza os perfis cujo nome contém `lh`.

O sistema escapa quebras de linha, aspas e cifrões para montar o comando, mas não valida a lógica RouterOS. Um erro de sintaxe ou um script lento passa a afetar todas as conexões que usam esses perfis. Teste antes em um equipamento controlado, mantenha uma cópia da versão anterior e evite dados sensíveis no texto.

## Perímetro de gerência

**Bloquear Gerência das RBs** é a chave global de uma política de firewall. Para ativá-la é obrigatório cadastrar pelo menos um IP de gerência. A política só fica completa nos Mikrotiks que também possuem **Bloquear Gerência** marcado individualmente no cadastro do servidor.

Quando as duas opções estão ativas, o LHISP recria regras da cadeia `input` para:

- permitir conexões estabelecidas e relacionadas;
- permitir o endereço do LHISP, os IPs cadastrados em **IPs de Gerência**, o gateway e servidores de monitoramento;
- manter permissões necessárias de DHCP, DNS, ICMP e descoberta conforme rede/interface;
- bloquear ao final tráfego TCP/UDP destinado ao próprio roteador que não foi permitido.

Quando o bloqueio global ou individual está desativado, a rotina ainda protege DNS nas interfaces de Internet, adicionando regra que descarta consultas UDP/53 vindas dessas interfaces.

Os IPs da tabela são recriados no banco a cada salvamento: entradas removidas da tela são excluídas e as restantes são inseridas novamente. A descrição é apenas identificação operacional; o endereço é o que entra na lista do firewall.

Antes de ativar, inclua todos os caminhos reais de administração e confirme o IP de origem visto pelo roteador, inclusive VPN, NAT e bastion. Uma lista incompleta pode bloquear o acesso remoto aos equipamentos.

## O que acontece ao salvar

O salvamento ocorre em uma transação no banco e depois, ainda dentro do fluxo, gera comandos para cada Mikrotik:

1. grava DNS, multiplicadores, scripts e política de gerência;
2. sincroniza a tabela de IPs de gerência;
3. remove e recria as regras de firewall de entrada gerenciadas pelo LHISP;
4. atualiza a lista DNS e a permissão de consultas remotas;
5. se o limite de burst mudou, atualiza a velocidade de todos os acessos e os desconecta;
6. se os scripts mudaram, atualiza os perfis PPPoE;
7. ao final da requisição, notifica o serviço responsável por executar as filas de comandos.

O banco pode confirmar o salvamento antes de todos os equipamentos terminarem a aplicação. Depois da mudança, confira filas, status SSH, DNS e firewall de uma amostra de servidores.

## Procedimento seguro

1. Exporte ou registre os valores atuais e faça backup dos Mikrotiks.
2. Valide DNS e IPs de gerência fora do LHISP.
3. Identifique quantos servidores e acessos serão afetados.
4. Planeje janela se houver mudança de burst ou política de gerência.
5. Salve uma única alteração coerente.
6. Acompanhe as filas de comandos e erros de SSH.
7. Teste resolução DNS, acesso administrativo, PPPoE e velocidade.

## Problemas comuns

| Sintoma | Verificação |
|---|---|
| Não é possível ativar o bloqueio | Adicione pelo menos um IP de gerência. |
| Administração remota parou | Confirme chave global, opção individual do servidor e IP de origem efetivo; use acesso fora de banda para corrigir. |
| DNS não foi aplicado | Valide formato dos endereços, fila de comandos e SSH do Mikrotik. |
| Clientes reconectaram após salvar | Mudança no multiplicador de burst atualiza velocidades e desconecta acessos. |
| Script PPPoE falha | Revise sintaxe RouterOS e o comando aplicado aos perfis `lh`; restaure o texto anterior. |
| Alguns servidores mantêm configuração antiga | A rotina automática deste cadastro é específica para Mikrotik; confira fabricante e comandos pendentes. |

![Configurações Globais da Rede](/assets/screenshots/rede-infra/configuracoes-globais.png)
