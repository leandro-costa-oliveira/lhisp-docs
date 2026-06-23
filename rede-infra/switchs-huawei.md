---
title: Switchs Huawei
published: true
editor: markdown
description: ''
---

# Switchs Huawei

> **⚠️ Rascunho gerado por agente**
>
> Este documento foi produzido a partir da exploração da wiki do LHISP e da visualização de um fluxo relacionado no ambiente de demonstração. Credenciais, chaves e valores exatos devem ser validados pela equipe técnica antes de publicação final.

## Objetivo

Registrar o procedimento descrito na wiki para configurar **Switchs Huawei** e integrar o equipamento ao ecossistema **LHISP**.

## Quando usar

Use este fluxo quando for necessário:

- realizar a configuração inicial de um switch Huawei;
- habilitar acesso remoto via SSH;
- criar usuários locais de administração;
- configurar o endereço IP de gerenciamento;
- definir a rota padrão do equipamento;
- integrar autenticação via Radius com o LHISP.

## Pré-requisitos

- Acesso físico ao equipamento via console serial.
- Cabo console DB9/RJ45 e adaptador, se necessário.
- Credenciais administrativas válidas.
- Endereço IP de gerenciamento do switch.
- Gateway padrão da rede de gerência.
- Dados do servidor Radius do LHISP.
- Permissão para alterar a configuração do equipamento.
- Validação prévia de que o cenário pertence ao ambiente de demonstração ou a um laboratório autorizado.

## Passo a passo

### 1. Acessar o switch

1. Conecte o cabo console ao equipamento.
2. Abra uma sessão serial no computador.
3. Entre com as credenciais administrativas.
4. Após o login, entre no modo de configuração.

### 2. Entender os modos de operação

A wiki descreve dois estados principais do prompt:

- **Execução**: prompt inicial após o login.
- **Enable**: modo com privilégios elevados, acessado com `system-view`.

### 3. Definir o nome do equipamento

No modo de configuração, ajuste o `sysname` para identificar o switch na rede.

```text
sysname NOME-DO-SEU-EQUIPAMENTO
```

### 4. Visualizar interfaces

Use o comando indicado na wiki para listar as descrições das interfaces e validar a conectividade.

```text
display interfaces description
```

### 5. Habilitar acesso remoto por SSH

Ative o servidor SSH e permita autenticação por senha, conforme a política do ambiente.

```text
stelnet server enable
ssh authentication-type default password
```

### 6. Habilitar autenticação local e via rede

Configure a interface VTY para aceitar autenticação via AAA e tráfego inbound conforme necessário.

```text
user-interface vty 0 4
authentication-mode aaa
protocol inbound all
```

### 7. Criar usuários locais

Crie usuários administrativos com privilégios elevados para console, SSH e HTTP.

### 8. Configurar endereço IP

Acesse a interface de gerenciamento apropriada e aplique o endereço IP do switch.

```text
interface 40GE0/0/2
undo portswitch
ip address 192.168.0.10 24
```

### 9. Configurar gateway padrão

Ajuste a rota padrão do equipamento apontando para o gateway da rede de gerência.

```text
ip route-static 0.0.0.0 0 192.168.0.1
```

### 10. Configurar autenticação via Radius

1. Entre no modo `system-view`.
2. Defina o template Radius do LHISP.
3. Informe o endereço do servidor Radius.
4. Configure autenticação, accounting e o domínio do ambiente.
5. Valide que o acesso ao switch passará a usar o fluxo integrado ao LHISP.

A wiki informa que a senha do Radius segue o padrão `LhSrv + ID do cadastro da empresa`.

### 11. Finalizar e salvar

1. Saia do modo de configuração com `quit`.
2. Salve as alterações no equipamento com `save`.

## Campos importantes

### Parâmetros observados na wiki

| Campo / comando | Descrição |
|---|---|
| **Login / Password** | Credenciais administrativas do equipamento. A wiki traz valores padrão de laboratório; neste documento foram tratados como sensíveis. |
| **system-view** | Entra no modo de configuração do switch. |
| **sysname** | Nome do switch na rede. |
| **display interfaces description** | Lista descrições de interfaces. |
| **stelnet server enable** | Habilita o servidor SSH no equipamento. |
| **user-interface vty 0 4** | Configuração das linhas virtuais de acesso remoto. |
| **authentication-mode aaa** | Ativa autenticação via AAA. |
| **interface 40GE0/0/2** | Exemplo de interface usada para configurar o IP. |
| **ip route-static** | Define a rota padrão. |
| **radius-server template lhisp** | Template Radius associado ao LHISP. |
| **radius-server shared-key cipher** | Chave compartilhada do Radius. |
| **domain huawei** | Domínio usado para integrar autenticação e accounting. |

## Resultado esperado

- O switch fica com acesso remoto habilitado.
- Os usuários locais passam a existir para administração.
- O endereço IP e o gateway ficam configurados.
- A autenticação Radius passa a apontar para o LHISP.
- O equipamento fica pronto para operação e monitoramento.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| Não consigo acessar a console | Verifique cabo, adaptador serial e porta COM/tty. |
| `system-view` não entra | Confirme a credencial administrativa. |
| O SSH não responde | Revise `stelnet server enable` e a configuração da VTY. |
| O switch não responde no IP de gerência | Revise IP, máscara e interface usada no `undo portswitch`. |
| Radius não autentica | Revise o template, a chave compartilhada e o domínio configurado. |

## Observações

- A wiki descreve o switch Huawei como um fluxo completo de acesso, gerenciamento e integração via Radius.
- A documentação mistura comandos de console, configuração de IP e autenticação centralizada.
- O demo foi usado apenas como referência visual para um fluxo similar de equipamento de rede (`GePON PACSWITCH`), já que não há uma tela 1:1 do switch Huawei no ambiente de demonstração.

## Dúvidas para revisão

- O modelo alvo é sempre o mesmo ou há variações de switch Huawei suportadas?
- O `ssh authentication-type default password` é obrigatório em todos os ambientes?
- Quais interfaces devem ser usadas como padrão para o IP de gerenciamento?
- O template Radius `lhisp` é fixo ou pode mudar por cliente/ambiente?
- A senha `LhSrv<ID>` é sempre derivada do cadastro da empresa?

## Screenshots sugeridos

- Tela do demo usada como referência visual do fluxo de equipamento de rede: `assets/screenshots/rede-infra/switchs-huawei.png`

![Switchs Huawei no demo](/assets/screenshots/rede-infra/switchs-huawei.png)
