---
title: Cadastrar servidor
published: true
editor: markdown
description: ''
---

# Cadastrar servidor

> **⚠️ Rascunho gerado por agente**
>
> Este documento foi elaborado a partir de exploração no ambiente de demonstração. A criação efetiva de servidores deve ser validada pela equipe técnica antes de publicação.

## Objetivo

Cadastrar um novo **servidor** no módulo **Rede/Infra** do LHISP.

## Quando usar

Use este fluxo para registrar um roteador, concentrador, equipamento de acesso, gateway ou servidor relacionado à infraestrutura de rede.

## Pré-requisitos

- Acesso ao menu **Rede/ Infra**.
- Permissão para criar/editar servidores.
- Dados do equipamento disponíveis: nome, IP, usuário, senha e parâmetros de conexão.
- Usar apenas dados fictícios no ambiente demo.

## Passo a passo

1. Acesse o menu lateral e abra **Rede/ Infra**.
2. Clique em **Servidores**.
3. Na tela de servidores, clique em **Novo**.
4. Preencha o formulário de cadastro:
   - **Ponto de Presença**
   - **Conectar por**
   - **Tipo**
   - **Nome**
   - **Endereço IP**
   - **Interface de Internet**
   - **Usuário**
   - **Senha**
   - **Portas SSH**
   - **Portas Web**
   - **Porta Syslog**
   - **Comunidade SNMP**
   - **Versão SNMP**
   - **SNMP Max Idx**
   - **Voltagem Mínima**
   - **Status Icmp**
   - **Status SSH**
   - **Tipo de Nat**
   - **Prefixo Público de Source Nat**
   - **Portas por IP**
   - Checkboxes de autenticação/operação
5. Marque **Ativo** e os demais recursos conforme a função do equipamento.
6. Clique em **Salvar**.
7. Valide se o servidor aparece na aba/lista correspondente e se os dados foram gravados.

## Campos importantes

### Identificação e conexão

| Campo | Descrição |
|---|---|
| **Id** | Identificador interno do registro. |
| **Importação** | Referência de importação, quando o cadastro veio de integração. |
| **Ponto de Presença** | POP ao qual o servidor pertence. Possui botão de busca. |
| **Conectar por** | Campo de vínculo/seleção de servidor de conexão. Possui botões de busca e limpeza. |
| **Tipo** | Fabricante/tipo do equipamento. Opções observadas: **Mikrotik**, **Ubiquit**, **Intelbras**, **Datacom**, **Wxbr**, **PacSwitch**, **Huawei**, **Juniper**, **Cisco**, **A10** e **Outros**. |
| **Nome** | Nome amigável do servidor. |
| **Endereço IP** | IP do equipamento. **Campo obrigatório observado na tela.** |
| **Interface de Internet** | Interface usada para saída/Internet. |
| **Usuário** | Usuário de acesso ao equipamento. |
| **Senha** | Senha de acesso ao equipamento. |

### Porta, SNMP e status

| Campo | Descrição |
|---|---|
| **Portas SSH** | Porta SSH do equipamento. Valor padrão observado: **22**. |
| **Portas Web** | Porta da interface web. Valor padrão observado: **80**. |
| **Porta Syslog** | Porta usada para syslog. |
| **Comunidade SNMP** | Comunidade SNMP configurada no servidor. |
| **Versão SNMP** | Versão SNMP. Opções observadas: **1** e **2c**. |
| **SNMP Max Idx** | Índice máximo SNMP. |
| **Voltagem Mínima** | Limite mínimo de voltagem, quando aplicável. |
| **Status Icmp** | Estado do ICMP no registro. |
| **Status SSH** | Estado/descrição de SSH no registro. |
| **Info** | Mensagem informativa/diagnóstico do servidor. |

### NAT, PPPoE e recursos adicionais

| Campo | Descrição |
|---|---|
| **Tipo de Nat** | Tipo de NAT. Opções observadas: **Masquerade**, **Src-Nat** e **Same**. |
| **Prefixo Público de Source Nat** | Prefixo público associado ao Source NAT. |
| **Portas por IP** | Quantidade de portas por IP. |
| **Pap / Chap / MsChap 1 / MsChap 2** | Métodos de autenticação PPPoE. |
| **Ativo** | Ativa o cadastro do servidor. |
| **Transmissor Wireless** | Indica uso como transmissor wireless. |
| **Servidor de Acesso/ PPPoE** | Indica se o equipamento atua como servidor de acesso. |
| **Enlace** | Marca o servidor como enlace. |
| **Usar Radius** | Habilita integração com Radius. |
| **Servidor DNS** | Define o equipamento como servidor DNS. |
| **Usar endereço do Servidor nas conexões PPPoE ?** | Usa o endereço do servidor nas conexões PPPoE. |
| **Enviar Alertas ?** | Habilita envio de alertas. |
| **Efetuar Backups ?** | Habilita backups automáticos. |
| **Usar PCQ no Mikrotik** | Habilita uso de PCQ quando o tipo é Mikrotik. |
| **IP Dinâmico** | Indica que o equipamento trabalha com IP dinâmico. |
| **Filtros de Segurança (TcpSynCookies e RpFilter:strict)** | Recurso de hardening/segurança. |
| **Bloquear Gerência** | Restringe acesso de gerência. |
| **cgnat_file** | Campo de arquivo para importação relacionada a CGNAT. |

## Resultado esperado

- O servidor fica cadastrado no módulo **Rede/Infra**.
- O registro passa a poder ser consultado, editado e usado em fluxos de rede/infraestrutura.
- Os campos de conexão e monitoração ficam disponíveis para rotinas de operação.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| O botão **Salvar** não grava | Revise principalmente **Endereço IP**, **Nome**, **Tipo** e os dados de conexão. |
| O equipamento não aparece na busca | Verifique se o cadastro está **Ativo** e se o **Ponto de Presença** foi selecionado corretamente. |
| SNMP/SSH não respondem | Confirme porta, usuário, senha e se os serviços estão habilitados no equipamento. |
| O tipo de NAT não faz sentido para o cenário | Revise a escolha entre **Masquerade**, **Src-Nat** e **Same**. |
| O cadastro parece incompleto após salvar | Reabra o servidor e valide se as opções de segurança, backups e PPPoE foram marcadas conforme esperado. |

## Observações

- O botão **Novo** abre o formulário de cadastro com vários campos já prontos para edição.
- Na exploração, os botões **Salvar** e **Cancelar** ficam disponíveis no topo do formulário.
- Alguns campos possuem botões auxiliares de pesquisa, como **Procurar POP** e **Procurar Servidor**.
- O módulo possui abas adicionais: **Redes**, **IPv4**, **IPv6**, **CGNAT**, **Servidores**, **Gráficos**, **Histórico**, **Interfaces**, **Traps**, **Rotas** e **Backups**.

## Dúvidas para revisão

- Quais campos são obrigatórios além de **Endereço IP**?
- O campo **Conectar por** é opcional ou obrigatório para alguns tipos de servidor?
- Em quais cenários a opção **Servidor de Acesso/ PPPoE** deve ser marcada?
- O campo **Info** é apenas informativo ou pode ser usado pelo processo de cadastro?
- Existe validação diferente por tipo de equipamento em **Tipo**?

## Screenshots sugeridos

- Formulário de cadastro de servidor: `assets/screenshots/rede-infra/cadastrar-servidor-form.png`

![Cadastro de servidor](/assets/screenshots/rede-infra/cadastrar-servidor-form.png)
