---
title: Switchs Huawei
published: true
editor: markdown
description: Cadastro e monitoramento de switch Huawei, com limites da configuração inicial de gerência.
---

# Switchs Huawei


## Objetivo

Registrar o procedimento descrito na wiki para configurar **Switchs Huawei** e integrar o equipamento ao ecossistema **LHISP**.

## Cadastro e limites da integração

No LHISP, o switch de infraestrutura é cadastrado em [Servidores](/rede-infra/servidores), com tipo **Huawei**, nome, IP, porta SSH, usuário e senha. Informe POP e parâmetros SNMP quando o equipamento participar do monitoramento. Confira as abas de interfaces e [gráficos](/rede-infra/monitoramento-de-graficos) após salvar.

Esse cadastro não configura automaticamente interfaces, VLAN de gerência, AAA ou autenticação administrativa por RADIUS no switch. A opção **Usar Radius** e as rotinas de corte de assinantes pertencem ao fluxo de concentrador; não habilite **Servidor de Acesso/PPPoE** apenas porque o equipamento é Huawei. Para um concentrador, siga [BRAS Huawei](/rede-infra/bras-huawei).

O código local não fornece uma receita de configuração inicial homologada para todo switch/VRP. As etapas abaixo definem os pontos a preparar e verificar com o manual do modelo. A captura no fim da página pertence ao fluxo GePON PACSWITCH e não comprova a tela nem a CLI de um switch Huawei.

## Quando usar

Use este fluxo quando for necessário:

- realizar a configuração inicial de um switch Huawei;
- habilitar acesso remoto via SSH;
- criar usuários locais de administração;
- configurar o endereço IP de gerenciamento;
- definir a rota padrão do equipamento;
- preparar a gerência e conferir o monitoramento no LHISP.

## Pré-requisitos

- Acesso físico ao equipamento via console serial.
- Cabo console DB9/RJ45 e adaptador, se necessário.
- Credenciais administrativas válidas.
- Endereço IP de gerenciamento do switch.
- Gateway padrão da rede de gerência.
- Modelo/versão e desenho de gerência definidos.
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
- **Configuração**: visão de sistema, acessada com `system-view` nas CLIs que oferecem esse comando. Ela não é um modo chamado `enable`.

### 3. Definir o nome do equipamento

No modo de configuração, ajuste o `sysname` para identificar o switch na rede.

```text
sysname NOME-DO-SEU-EQUIPAMENTO
```

### 4. Visualizar interfaces

Consulte o inventário e o estado das interfaces com a sintaxe da versão instalada. Confirme a porta física e sua função no projeto antes de qualquer alteração.

### 5. Habilitar acesso remoto por SSH

Prepare SSH e autenticação conforme o manual do modelo e a política da rede de gerência. Use no cadastro do servidor o mesmo endereço, porta e credenciais. Não habilite protocolos adicionais como efeito colateral dessa etapa.

### 6. Habilitar autenticação local e via rede

Configure as linhas VTY para o método de autenticação previsto no projeto e restrinja os protocolos de entrada. Preserve console ou outro caminho de retorno antes de alterar AAA; uma configuração aceita pode bloquear a próxima sessão.

### 7. Criar usuários locais

Crie um usuário exclusivo para a integração, com acesso SSH e permissões para as operações necessárias. Habilite serviços administrativos adicionais somente quando houver uso definido.

### 8. Configurar endereço IP

Identifique a interface física, VLANIF ou porta dedicada de gerência prevista no projeto e configure IP/máscara. Não converta uma porta de comutação em roteada apenas para seguir um exemplo: isso altera sua função e pode interromper o tráfego existente.

### 9. Configurar gateway padrão

Confirme a rota de retorno entre o switch e a infraestrutura do LHISP. Configure gateway/rota somente conforme a topologia de gerência existente.

### 10. Conferir SSH e SNMP no LHISP

1. Salve o cadastro do servidor com tipo **Huawei** e os parâmetros corretos.
2. Confira o estado ICMP/SSH e a leitura de interfaces por SNMP.
3. Configure apenas os gráficos necessários.
4. Valide o serviço real e a persistência da configuração do equipamento.

A autenticação administrativa do switch por RADIUS exige projeto e validação próprios. O cadastro no LHISP não comprova que esse fluxo foi configurado ou é compatível com o equipamento.

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
| **Portas SSH** | Porta usada para a conexão ao equipamento. |
| **Comunidade SNMP / Versão SNMP** | Parâmetros usados para consultar interfaces e métricas. |
| **Ponto de Presença** | Localização do equipamento no monitor. |

## Resultado esperado

- O switch fica com acesso remoto habilitado.
- Os usuários locais passam a existir para administração.
- O endereço IP e o gateway ficam configurados.
- O cadastro e o monitoramento correspondem ao equipamento correto.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| Não consigo acessar a console | Verifique cabo, adaptador serial e porta COM/tty. |
| `system-view` não entra | Confirme a credencial administrativa. |
| O SSH não responde | Revise porta, usuário, senha, VTY, ACL e caminho de gerência. |
| O switch não responde no IP de gerência | Revise IP, máscara, VLAN/interface de gerência e rota de retorno. |
| Interfaces ou gráficos não carregam | Confira comunidade/versão SNMP, alcance e OIDs do equipamento. |

## Observações

- A preparação inicial por console depende do modelo/VRP e não foi validada em equipamento nesta revisão.
- Evite aplicar rotinas de atualização feitas para RouterOS a um switch Huawei; revise o fabricante e os comandos antes de executar.
- O demo foi usado apenas como referência visual para um fluxo similar de equipamento de rede (`GePON PACSWITCH`), já que não há uma tela 1:1 do switch Huawei no ambiente de demonstração.


## Screenshots sugeridos

- Tela do demo usada como referência visual do fluxo de equipamento de rede: `assets/screenshots/rede-infra/switchs-huawei.png`

![Switchs Huawei no demo](/assets/screenshots/rede-infra/switchs-huawei.png)

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.
