---
title: OLT V-Solutions
published: true
editor: markdown
description: ''
---

# OLT V-Solutions

> **⚠️ Rascunho gerado por agente**
>
> Este documento foi produzido a partir da exploração da wiki do LHISP e da visualização de um fluxo relacionado no ambiente de demonstração. Campos sensíveis, credenciais e valores operacionais exatos devem ser validados pela equipe técnica antes de publicação final.

## Objetivo

Registrar o procedimento descrito na wiki para configurar uma **OLT V-Solutions** e integrar o equipamento ao ecossistema **LHISP**.

## Quando usar

Use este fluxo quando for necessário:

- cadastrar ou revisar uma OLT V-Solutions no LHISP;
- informar os parâmetros de comunicação do equipamento;
- separar PONs e uplinks por VLAN;
- configurar a VLAN nativa das portas PON;
- ajustar a VLAN nativa das portas uplink;
- limpar a VLAN padrão quando o cenário exigir;
- gravar a configuração final da OLT.

## Pré-requisitos

- Acesso ao painel web da OLT.
- Credenciais administrativas válidas.
- IP de gerenciamento do equipamento.
- Comunidade SNMP e parâmetros de timeout, quando usados.
- VLANs definidas para o desenho de rede.
- Permissão para alterar a configuração do equipamento.
- Validação prévia de que o cenário pertence ao ambiente de demonstração ou a um laboratório autorizado.

## Passo a passo

### 1. Acessar a OLT

1. Abra o endereço web da OLT.
2. Entre com o usuário e a senha administrativos.
3. Confirme que a tela inicial carrega corretamente.

### 2. Entender o tipo de equipamento

A wiki lista a OLT como um equipamento **V-Solutions** e indica que a configuração básica passa por:

- acesso ao equipamento;
- separação entre portas PON e uplinks;
- criação de VLANs;
- definição de VLAN nativa;
- limpeza da VLAN padrão;
- gravação da configuração.

### 3. Criar as VLANs necessárias

1. Abra a área de VLANs.
2. Cadastre cada VLAN necessária para as portas PON.
3. Use uma descrição clara para identificar a porta ou o grupo correspondente.
4. Repita o processo até cobrir todas as portas planejadas.

### 4. Configurar a VLAN nativa nas portas PON

1. Acesse a área de configuração das portas PON.
2. Localize a coluna de VLAN nativa.
3. Ajuste cada porta PON para a VLAN correspondente.
4. Valide se o tráfego sem tag será tratado pela VLAN esperada.

### 5. Configurar a VLAN nativa nas portas uplink

1. Abra a área de uplinks.
2. Defina a VLAN nativa que será usada para o tráfego de saída.
3. Confirme se a porta uplink está associada ao desenho de rede correto.

### 6. Remover as portas da VLAN padrão

1. Verifique quais portas ainda permanecem na VLAN padrão.
2. Remova as portas que não devem ficar nessa VLAN.
3. Confirme que a segmentação ficou coerente com o projeto.

### 7. Gravar as configurações

1. Revise os valores cadastrados.
2. Salve a configuração na OLT.
3. Reabra a tela se necessário para confirmar que os dados persistiram.

## Campos importantes

### Parâmetros observados na wiki

| Campo / etapa | Descrição |
|---|---|
| **Ponto de Presença** | Identifica o POP associado à OLT. |
| **Tipo** | Lista de perfis suportados; a wiki mostra opções como **FIT FNL 1000**, **FIT FNL 2000**, **FIT FNL 5000**, **CIANET CTS2720**, **V-Solutions** e **Intelbras EPON**. |
| **Conectar por** | Modo de conexão/associação do equipamento. |
| **IP** | Endereço de gerenciamento da OLT. |
| **Comunidade SNMP** | Comunidade usada para monitoração. |
| **Porta SNMP** | Porta SNMP do equipamento. |
| **Timeout SNMP** | Tempo de espera da consulta SNMP. |
| **Descrição** | Campo livre para identificação do registro. |
| **VLANs** | Usadas para separar PONs, uplinks e o tráfego padrão. |

## Resultado esperado

- A OLT fica cadastrada com o tipo correto.
- As VLANs de PON e uplink ficam separadas.
- A VLAN nativa fica alinhada ao desenho da rede.
- A VLAN padrão é removida quando necessário.
- O equipamento fica pronto para operação e monitoramento no LHISP.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| Não consigo abrir a OLT no navegador | Verifique IP, credenciais e conectividade. |
| O tipo V-Solutions não aparece | Confirme se o perfil correto foi carregado na tela. |
| As VLANs não persistem | Refaça o salvamento e valide a gravação final. |
| A PON continua na VLAN errada | Revise a coluna de VLAN nativa e a associação da porta. |
| O uplink não propaga o tráfego esperado | Revise a VLAN nativa e a limpeza da VLAN padrão. |

## Observações

- A wiki descreve a OLT V-Solutions como um fluxo de configuração web com foco em VLANs e segmentação de portas.
- O material mistura cadastro de equipamento com a lógica operacional de PON/uplink.
- O demo foi usado apenas como referência visual para o contexto de OLT e cadastro de rede.
- Os detalhes exatos de criação de VLAN e gravação dependem do ambiente e do firmware do equipamento.

## Dúvidas para revisão

- A tela do LHISP grava a OLT diretamente ou apenas armazena os parâmetros de integração?
- Há diferença prática entre **GePON OLT** e **GPON OLT** no fluxo de cadastro?
- Quais perfis de tipo são realmente usados em produção?
- A definição de VLAN nativa é obrigatória para todos os modelos V-Solutions?
- Qual é a convenção recomendada para o intervalo de VLANs por PON?

## Screenshots sugeridos

- Tela de cadastro/integração da OLT no demo usada como referência visual: `assets/screenshots/rede-infra/olt-v-solutions.png`

![OLT V-Solutions no demo](/assets/screenshots/rede-infra/olt-v-solutions.png)
