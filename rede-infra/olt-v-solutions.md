---
title: OLT V-Solutions
published: true
editor: markdown
description: Diferenças entre integração V-Solutions EPON por SNMP e VSOL GPON por SSH.
---

# OLT V-Solutions


## Objetivo

Registrar o procedimento descrito na wiki para configurar uma **OLT V-Solutions** e integrar o equipamento ao ecossistema **LHISP**.

## Escolher o cadastro correto

O LHISP possui dois caminhos separados. Confirme a tecnologia antes de cadastrar:

| Tecnologia | Cadastro e comunicação |
|---|---|
| **EPON/GePON** | [GePON OLT](/rede-infra/gepon-olt), tipo **V-Solutions**. O adaptador usa IP/porta, comunidade SNMP e timeout SNMP. |
| **GPON** | [GPON OLT](/rede-infra/gpon-olt), fabricante **VSOL**, com modelo V1600/firmware **V1.5** ou **V2.3** no campo **Versão**. Os configuradores usam SSH, usuário, senha e senha enable. |

Essas opções refletem os adaptadores existentes no código; não comprovam homologação de qualquer outro modelo ou firmware. No GPON, confira a versão explicitamente: valor ausente ou não reconhecido cai no configurador V1.5. Selecionar uma versão inadequada pode enviar comandos incompatíveis.

No GPON, salvar o cadastro não executa configuração inicial adicional no gancho `afterSave` dos dois configuradores. Entretanto, autorização/desautorização e configuração de acesso podem enviar comandos. O método genérico `saveConfig` está vazio nessas classes; algumas rotinas enviam `write` diretamente. Confirme a persistência de cada operação, sem presumir que a opção **Gravar Configurações?** persista qualquer mudança.

Os métodos específicos de configurar WAN PPPoE e WAN bridge retornam **NAO IMPLEMENTADO** nas duas versões. Não confunda a autorização de ONU ou a aplicação de VLAN com suporte a todas as funções de roteador da ONU.

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

### 6. Revisar as portas da VLAN padrão

1. Verifique quais portas ainda permanecem na VLAN padrão.
2. Remova uma associação somente se o projeto exigir e após confirmar que ela não transporta a gerência ou um serviço em uso.
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
- O cadastro usa o adaptador da tecnologia correta; a comunicação e o provisionamento necessários devem ser validados separadamente.

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
- As etapas do painel web são uma referência de planejamento. Confira os nomes dos menus e a sequência de configuração no manual do firmware instalado.


## Screenshots sugeridos

- Tela de cadastro/integração da OLT no demo usada como referência visual: `assets/screenshots/rede-infra/olt-v-solutions.png`

![OLT V-Solutions no demo](/assets/screenshots/rede-infra/olt-v-solutions.png)

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.
