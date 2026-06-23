---
title: BRAS Huawei
published: true
editor: markdown
description: ''
---

# BRAS Huawei

> **⚠️ Rascunho gerado por agente**
>
> Este documento foi produzido a partir da exploração da wiki do LHISP e da visualização do módulo relacionado no ambiente de demonstração. Os comandos de equipamento e parâmetros sensíveis devem ser validados pela equipe técnica antes de publicação final.

## Objetivo

Registrar o procedimento descrito na wiki para configurar um **BRAS Huawei** e integrar o equipamento ao ecossistema **LHISP**.

## Quando usar

Use este fluxo quando for necessário:

- realizar a configuração inicial de um BRAS/Huawei;
- habilitar acesso remoto ao equipamento;
- configurar comunicação com **Radius**;
- ajustar parâmetros de **PPPoE** e **SNMP**;
- preparar o equipamento para integração operacional com o LHISP.

## Pré-requisitos

- Acesso físico ao equipamento via console serial.
- Cabo console RS232/DB9 e adaptador, se necessário.
- Credenciais de acesso ao equipamento.
- Endereço IP do BRAS e do servidor LHISP.
- Chave compartilhada do Radius.
- Permissão para alterar a configuração do equipamento.
- Validação prévia de que o equipamento pertence ao ambiente de demonstração ou a um laboratório autorizado.

## Passo a passo

### 1. Acessar o BRAS

1. Conecte o cabo console ao equipamento.
2. No computador, abra uma sessão serial.
3. Entre com as credenciais de acesso.
4. Após o login, entre no modo de configuração.

### 2. Entrar no modo de configuração

```text
system-view
```

### 3. Configuração inicial

- Defina o **sysname** do equipamento.
- Verifique as interfaces disponíveis.
- Habilite o acesso remoto por SSH.
- Ajuste a autenticação dos usuários locais e via rede.

### 4. Criar usuários locais

Crie usuários com privilégios elevados para acesso administrativo, conforme a política do ambiente.

### 5. Configurar endereço IP e gateway

- Acesse a interface desejada.
- Aplique o endereço IP.
- Configure a rota padrão do equipamento.

### 6. Configurar comunicação com o Radius

- Crie o grupo Radius do LHISP.
- Configure a chave compartilhada.
- Informe os endereços do servidor de autenticação e accounting.
- Ajuste a autenticação e accounting no `aaa`.
- Associe o domínio ao Radius configurado.

### 7. Configurar servidor PPPoE

- Defina a interface de serviço.
- Ajuste o comportamento de VLAN, quando aplicável.
- Habilite os parâmetros de acesso necessários.

### 8. Configurar SNMP

- Habilite a comunidade de leitura.
- Ajuste a versão SNMP conforme o padrão do ambiente.
- Valide se o LHISP poderá coletar informações de monitoramento.

### 9. Finalizar e salvar

Finalize a sessão e salve a configuração.

```text
quit
save
```

## Campos importantes

### Parâmetros observados na wiki

| Campo / comando | Descrição |
|---|---|
| **Login / Password** | Credenciais de console do equipamento. Na wiki, os valores aparecem como padrão de laboratório e devem ser tratados com cuidado. |
| **sysname** | Nome do equipamento na rede. |
| **display interfaces description** | Comando para listar descrições das interfaces. |
| **SSH** | Habilita acesso remoto seguro ao equipamento. |
| **Radius shared-key** | Chave usada na integração com autenticação. |
| **radius-server authentication/accounting** | Endereços do LHISP para autenticação e contabilização. |
| **SNMP community** | Comunidade usada para coleta de informações. |
| **PPPoE / VLAN** | Ajustes de acesso de assinantes, quando o cenário usa esse perfil. |

## Resultado esperado

- O BRAS fica com acesso remoto habilitado.
- O equipamento passa a autenticar usuários via Radius/LHISP.
- Os serviços de PPPoE e SNMP ficam prontos para operação e monitoramento.
- A equipe pode seguir com a configuração de rede/assinantes conforme o padrão do ambiente.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| Não consigo acessar a console | Verifique o cabo, o adaptador serial e a porta COM/tty utilizada. |
| O comando `system-view` não entra | Confirme se o login foi feito com permissão administrativa. |
| Radius não autentica | Revise o endereço do LHISP, a chave compartilhada e a porta configurada. |
| SNMP não responde no LHISP | Verifique comunidade, versão SNMP e conectividade de rede. |
| PPPoE não sobe | Confirme interface, VLAN, parâmetros de acesso e serviço associado. |
| Usuário PPPoE não conecta | Use `display aaa online-fail-record username <NomeDoUsuarioPppoe>` para consultar o motivo da falha de login do usuário. |
| Erro de conflito de IP | Use `display aaa access-user ip-address <IpAddress>` para localizar o usuário/assinante associado ao IP em conflito. |

## Debug

- Quando houver suspeita de **conflito de IP**, consulte o usuário AAA associado ao endereço com:

```text
display aaa access-user ip-address <IpAddress>
```

- O comando ajuda a identificar qual sessão/assinante está usando o IP informado e acelera a análise do incidente.

## Observações

- A wiki descreve o BRAS Huawei como um conjunto de comandos de configuração e integração com o LHISP.
- A credencial exibida na wiki foi tratada como informação sensível e deve ser validada antes de qualquer uso.
- O demo foi usado apenas como referência visual para o contexto de servidores/equipamentos de rede.
- O conteúdo da wiki mescla instruções para BRAS Huawei e comandos de configuração que afetam a integração com o sistema.

## Dúvidas para revisão

- O conteúdo é aplicado a BRAS Huawei, Switch Huawei ou ambos?
- Quais parâmetros são obrigatórios para o padrão de produção?
- A chave Radius é sempre derivada do ID da empresa ou pode ser customizada?
- O passo de PPPoE varia entre interfaces com e sem VLAN?
- Quais comandos precisam ser ajustados para versões diferentes do firmware Huawei?

## Screenshots sugeridos

- Tela de servidor/equipamento no demo usada como referência visual: `assets/screenshots/rede-infra/bras-huawei.png`

![BRAS Huawei no demo](/assets/screenshots/rede-infra/bras-huawei.png)
