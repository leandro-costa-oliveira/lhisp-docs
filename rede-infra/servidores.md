---
title: Servidores
published: true
editor: markdown
description: ''
---

# Servidores

> **⚠️ Rascunho gerado por agente**
>
> Esta página foi documentada a partir da tela equivalente no ambiente de demonstração do LHISP. A captura usada veio do demo e foi mantida sem marcações visuais.

## Objetivo

Consultar e administrar um servidor da rede no módulo de **Rede/Infra**, com seus dados de acesso, parâmetros de monitoramento, credenciais e opções de operação.

## Quando usar

Use esta tela quando precisar:

- localizar um servidor específico;
- revisar o IP e a identificação do equipamento;
- conferir credenciais e portas de acesso;
- validar parâmetros SNMP, ICMP, SSH e NAT;
- executar ações rápidas como **Ping / Traceroute** ou atualizar o cadastro.

## Pré-requisitos

- Estar autenticado no LHISP.
- Ter permissão para acessar o fluxo **Servidores**.
- Saber qual servidor será consultado.

## Passo a passo

1. Acesse **Rede/ Infra > Servidores**.
2. Confira o registro carregado na tela.
3. Use **Anterior** e **Próximo** para navegar entre servidores.
4. Use **Novo**, **Editar** ou **Apagar** para manutenção do cadastro.
5. Utilize as abas para inspecionar dados relacionados: **Dados**, **Redes**, **IPv4**, **IPv6**, **CGNAT**, **Servidores**, **Gráficos**, **Histórico**, **Interfaces**, **Traps**, **Rotas** e **Backups**.
6. Quando necessário, pressione **Ping / Traceroute** ou **Atualizar Servidor**.
7. Para auditoria de acesso, use os botões de visualização de senha e segredo Radius.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| **Id** | Identificador do registro do servidor. |
| **Importação** | Campo de referência/importação do cadastro. |
| **Ponto de Presença** | POP associado ao servidor. |
| **Conectar por** | Seleção do host/ponte de conexão. |
| **Tipo** | Tipo do equipamento; no demo, `Mikrotik`. |
| **Nome** | Nome do servidor. |
| **Endereço IP** | IP de gerenciamento do equipamento. |
| **Interface de Internet** | Interface usada como uplink. |
| **Usuário** | Login administrativo. |
| **Senha** | Senha administrativa. |
| **Portas SSH** | Porta SSH configurada. |
| **Portas Web** | Porta web configurada. |
| **Porta Syslog** | Porta de syslog utilizada. |
| **Comunidade SNMP** | Comunidade SNMP do equipamento. |
| **Versão SNMP** | Versão SNMP habilitada. |
| **SNMP Max Idx** | Limite de índices SNMP. |
| **Voltagem Mínima** | Limite mínimo configurado. |
| **Status Icmp** | Estado do ICMP. |
| **Status SSH** | Estado do SSH. |
| **Info** | Mensagens de processamento/erro do servidor. |
| **Tipo de Nat** | Tipo de NAT aplicado. |
| **Prefixo Público de Source Nat** | Prefixo de source NAT. |
| **Portas por IP** | Número de portas por IP. |
| **Autenticação PPPoE** | Métodos PPPoE habilitados. |

## Resultado esperado

- O servidor selecionado aparece com seus dados principais preenchidos.
- As abas mostram as informações associadas ao equipamento.
- As ações rápidas podem ser usadas para diagnóstico ou manutenção.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| Mensagem de erro na tela | Verifique a integração do equipamento e a compatibilidade dos comandos. |
| Campos bloqueados | O registro pode estar em modo de consulta. |
| Credenciais não podem ser vistas | Use as ações próprias de visualização, quando liberadas. |

## Observações

- A rota observada no demo foi `/lgc/redeinfra%7Cservidores`.
- A tela é renderizada dentro de um **iframe legado**.
- O servidor exibido na captura era **ROT-TESTE [127.0.0.2]**.
- O formulário mostrava o erro: `Erro ao processar comandos: Error: Unsupported algorithm: blowfish-cbc`.
- A captura limpa mostra o conteúdo do iframe sem anotações visuais.

## Dúvidas para revisão

- O que exatamente aciona o campo **Conectar por**?
- O botão **Servidores** na barra de abas representa uma visão relacionada ou apenas uma agrupação do cadastro?
- A mensagem de erro `Unsupported algorithm: blowfish-cbc` indica um problema do ambiente demo ou uma limitação real do fluxo?

## Screenshots sugeridos

- Tela **Servidores** no demo: `assets/screenshots/rede-infra/servidores.png`

![Servidores no demo](/assets/screenshots/rede-infra/servidores.png)
