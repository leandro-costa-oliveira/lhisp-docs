---
title: OLT Huawei
published: true
editor: markdown
description: Preparação e integração de OLT Huawei ao cadastro GPON do LHISP.
---

# OLT Huawei


## Objetivo

Registrar o procedimento descrito na wiki para configurar uma **OLT Huawei** e integrar o equipamento ao ecossistema **LHISP**.

## Integração no LHISP

Cadastre o equipamento em [GPON OLT](/rede-infra/gpon-olt), fabricante **Huawei**, com descrição, IP, porta e credenciais de gerência. Esse cadastro é diferente do [BRAS Huawei](/rede-infra/bras-huawei), registrado em **Servidores**.

O configurador PHP atual da OLT usa **Telnet**, pelo endereço e porta cadastrados, e entra nos modos `enable` e `config`. Habilitar somente SSH no equipamento não atende esse caminho. Restrinja o transporte à rede de gerência autorizada.

**Salvar não é apenas inventário:** depois de gravar o cadastro, o configurador cria/ajusta perfis DBA, service profile e OMCI na OLT. Antes de salvar, confirme modelo, permissões e configuração existente. Depois, confira **Chassi**, ONUs e a rede GPON vinculada; a rede define slot, PON, uplink e VLAN usados no provisionamento.

A aba **Scripts** permite consultar os comandos extraídos do configurador sem se conectar à OLT. Use-a para revisão prévia. **Executar comandos**, autorização de ONU e atualização de acessos são ações operacionais; veja permissões e limites no guia de [GPON OLT](/rede-infra/gpon-olt).

## Limite da preparação inicial

As etapas de console abaixo descrevem objetivos de preparação. O código local não confirma a sequência de configuração inicial de todos os modelos Huawei. Confirmação de placas, interfaces de gerência e regras de acesso dependem do modelo e da versão; valide o manual correspondente antes de executar qualquer comando.

## Quando usar

Use este fluxo quando for necessário:

- realizar a configuração inicial de uma OLT Huawei;
- habilitar acesso de gerenciamento ao equipamento;
- criar usuário administrativo para acesso pelo sistema;
- configurar endereço IP de gerenciamento em modo *out of band* ou *inband*;
- ajustar gateway e controle de acesso;
- preparar a OLT para integração operacional com o LHISP.

## Pré-requisitos

- Acesso físico ao equipamento via console serial.
- Cabo console DB9/RJ45 e adaptador, se necessário.
- Credenciais administrativas válidas.
- Endereço IP de gerenciamento da OLT.
- Máscara de rede e gateway padrão.
- Permissão para alterar a configuração do equipamento.
- Validação prévia de que o cenário pertence ao ambiente de demonstração ou a um laboratório autorizado.

## Passo a passo

### 1. Acessar a OLT

1. Conecte o cabo console ao equipamento.
2. Abra uma sessão serial no computador.
3. Entre com as credenciais administrativas.
4. Entre no modo privilegiado e depois no modo de configuração.

### 2. Entender os modos de operação

A wiki descreve três estados principais do prompt:

- **Execução**: prompt inicial após o login.
- **Enable**: modo com privilégios elevados.
- **Config**: modo de configuração do equipamento.

### 3. Definir o nome do equipamento

No modo de configuração, ajuste o `sysname` para identificar a OLT na rede.

```text
sysname NOME-DO-SEU-EQUIPAMENTO
```

### 4. Verificar e ativar placas do chassi

1. Liste as placas instaladas no chassi.
2. Identifique modelo, slot e estado antes de confirmar ou ativar uma placa; não confirme todo o chassi indiscriminadamente.
3. Valide o status das placas de uplink e PON antes de seguir.

### 5. Criar usuário administrativo

Crie um usuário local que será usado para acesso e automação no ambiente LHISP.

### 6. Configurar gerenciamento da OLT

Há dois cenários descritos:

- **Out of Band**: usa a porta dedicada de gerenciamento.
- **Inband**: usa uma VLAN na porta de uplink.

### 7. Ajustar o gateway padrão

Configure a rota padrão apontando para o gateway do ambiente.

### 8. Controlar o acesso ao equipamento

Restrinja os serviços de gerência aos endereços autorizados. Preserve o acesso usado pelo configurador atual ao ajustar essas regras.

## Campos importantes

### Parâmetros observados na wiki

| Campo / comando | Descrição |
|---|---|
| **Login / Password** | Credenciais administrativas do equipamento. Os valores exibidos na wiki foram tratados como sensíveis e não foram reproduzidos aqui. |
| **enable** | Acesso ao modo privilegiado. |
| **config** | Entrada no modo de configuração. |
| **sysname** | Nome da OLT na rede. |
| **display board 0** | Comando para visualizar as placas do chassi. |
| **board confirm** | Operação de confirmação de placa; parâmetros dependem do modelo/slot e devem ser revisados antes da execução. |
| **terminal user name** | Criação de usuário local para administração. |
| **interface meth 0** | Configuração de gerenciamento *out of band*. |
| **interface vlanif 250** | Exemplo de gerenciamento *inband* via VLAN. |
| **ip route-static** | Configura a rota padrão do equipamento. |
| **IP, Porta, Usuário e Senha** | Destino e credenciais usados pelo configurador Telnet do cadastro GPON. |

## Resultado esperado

- A OLT fica com nome e gerenciamento configurados.
- O acesso administrativo passa a existir com usuário local.
- O endereço de gerenciamento fica acessível ao LHISP e aos operadores autorizados.
- A rede pode seguir com os ajustes de operação e integração com clientes/serviços.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| Não consigo acessar a console | Verifique cabo, adaptador serial e porta COM/tty. |
| `enable` ou `config` não funcionam | Confirme que a sessão foi aberta com credencial administrativa. |
| A OLT não responde no IP de gerenciamento | Revise IP, máscara, VLAN de gerenciamento e gateway. |
| Placas do chassi não aparecem corretamente | Refaça a leitura das placas e confirme o estado esperado antes de habilitar serviços. |
| SSH funciona, mas a integração falha | Confira o transporte Telnet usado pelo configurador, a porta cadastrada e as regras de gerência. |
| Salvar alterou perfis na OLT | O gancho de salvamento configura DBA, service profile e OMCI; revise a saída e os perfis existentes. |

## Observações

- A wiki trata a OLT Huawei como um fluxo de configuração de equipamento e gerenciamento de acesso.
- O conteúdo mistura instruções de console, gerenciamento *out of band* e *inband* e controle de acesso.
- Credenciais e valores exatos foram omitidos nesta documentação por segurança.
- O demo foi usado apenas como referência visual para o contexto de servidores/equipamentos de rede.


## Screenshots sugeridos

- Tela de servidor/equipamento no demo usada como referência visual: `assets/screenshots/rede-infra/olt-huawei.png`

![OLT Huawei no demo](/assets/screenshots/rede-infra/olt-huawei.png)

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.
