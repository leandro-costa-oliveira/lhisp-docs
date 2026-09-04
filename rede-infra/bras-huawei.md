---
title: BRAS Huawei
published: true
editor: markdown
description: Integração de um concentrador Huawei ao RADIUS, monitoramento e automações de rede do LHISP.
---

# BRAS Huawei

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O BRAS Huawei é o concentrador que termina as sessões PPPoE dos assinantes. No LHISP ele é cadastrado como um **servidor de rede do tipo Huawei**: o endereço do equipamento identifica o NAS no RADIUS, os acessos dos contratos fornecem usuário, senha e endereçamento, a bilhetagem registra as sessões e o SNMP fornece o tráfego apresentado no contrato.

Esse cadastro não é uma OLT Huawei. O BRAS concentra autenticação e tráfego IP; a OLT provisiona ONUs na rede óptica e possui cadastro e integração próprios em [OLT Huawei](/rede-infra/olt-huawei).

## O que precisa estar alinhado

A integração depende de configurações nos dois lados:

| No equipamento | No LHISP |
|---|---|
| IP alcançável a partir da infraestrutura do LHISP | Servidor com fabricante **Huawei**, IP e porta SSH correspondentes |
| Cliente RADIUS apontando para autenticação e accounting do LHISP | Opção **Usar RADIUS** habilitada e segredo igual ao configurado no BRAS |
| Domínio e perfil PPPoE que consultem o RADIUS | Acesso do contrato associado a esse servidor, com usuário e senha válidos |
| SSH administrativo | Usuário, senha e porta capazes de executar comandos no equipamento |
| SNMP permitido a partir do LHISP | Comunidade e versão SNMP corretas |

O código do equipamento varia por modelo e versão do VRP. Valide a sintaxe na documentação da Huawei e aplique a configuração inicial por console fora do LHISP. Em termos funcionais, ela deve habilitar SSH, AAA/RADIUS, accounting, o domínio PPPoE e SNMP. Salve a configuração somente depois dos testes.

## Cadastrar no LHISP

Em **Rede e Infraestrutura → Servidores**, crie ou edite o concentrador:

1. selecione o tipo **Huawei**;
2. informe nome, IP, credenciais e porta SSH;
3. associe o ponto de presença quando aplicável;
4. habilite **Usar RADIUS**;
5. configure comunidade e versão SNMP se houver leitura de tráfego;
6. confira o segredo RADIUS pela ação específica do servidor;
7. salve e valide autenticação, accounting e desconexão com um acesso de teste.

O IP e a porta SSH não podem duplicar outro servidor. Ao cadastrar ou alterar o registro, o backend atualiza o serviço de monitoramento e solicita a recarga do RADIUS. Alterar apenas o cadastro não configura automaticamente AAA, interfaces ou VLANs no Huawei.

## Relação com os acessos de clientes

O RADIUS localiza o servidor pelo atributo `NAS-IP-Address`. Em seguida valida o acesso ligado a esse servidor, inclusive usuário e senha com diferenciação entre maiúsculas e minúsculas. Serviço, contrato, endereço de rede e eventual bloqueio por MAC também participam da autorização.

Uma sessão autenticada gera bilhetagem. Para Huawei, o identificador de conexão gravado nessa sessão é usado como índice das OIDs proprietárias de tráfego. Sem accounting correto, o LHISP pode até autenticar o cliente, mas perder a associação necessária para histórico, sessão e gráfico.

Ao desconectar um acesso, o backend enfileira comandos Huawei para cortar as sessões pelo usuário e pelo IPv4. A execução depende do serviço de comandos, da conectividade SSH e das credenciais cadastradas; portanto, a alteração no contrato pode ser persistida antes de o comando chegar ao equipamento.

## SNMP e leitura de tráfego

O LHISP consulta contadores Huawei específicos de entrada e saída usando o identificador da última sessão. Para que o gráfico funcione:

- permita SNMP somente a partir dos endereços de gestão necessários;
- use no cadastro a mesma comunidade e versão do equipamento;
- mantenha o accounting RADIUS ativo;
- confirme que o acesso está associado ao BRAS correto.

SNMP sem resposta não impede necessariamente a autenticação PPPoE, mas impede ou degrada a leitura de tráfego e o monitoramento.

## CGNAT

Quando o Huawei também executa CGNAT, os prefixos públicos e privados são mantidos no cadastro do servidor. O LHISP valida a proporção dos blocos e, para Huawei, exige faixas de portas múltiplas de 256. A combinação sugerida pelo próprio backend é um `/32` público para um `/25` privado.

Depois de alterar prefixos, revise os comandos gerados antes de aplicá-los. Um bloco incorreto pode provocar sobreposição de portas, falta de tradução ou conflito com endereços já entregues aos assinantes. Consulte também [CGNAT](/rede-infra/cgnat) e [Prefixos de IP](/rede-infra/prefixos-de-ip).

## Diagnóstico no equipamento

Use os comandos abaixo em uma sessão administrativa autorizada. Eles consultam estado e não corrigem o cadastro:

```text
display aaa online-fail-record username <usuario_pppoe>
display access-user username <usuario_pppoe>
display access-user ip-address <endereco_ip>
display access-user summary
display access-user domain lhisp summary
display access-user domain lhisp
```

- `online-fail-record` ajuda a identificar a causa de uma tentativa negada;
- `access-user username` e `access-user ip-address` localizam a sessão ativa;
- os comandos `summary` conferem volume total e por domínio.

No LHISP, use também o diagnóstico RADIUS disponível no acesso do contrato. Ele compara servidor, serviço, usuário, senha, MAC, último NAS e o registro recente do RADIUS sem modificar o acesso.

## Problemas comuns

| Sintoma | Verificação |
|---|---|
| RADIUS não autentica | Compare `NAS-IP-Address`, segredo, domínio AAA, usuário e senha; confirme que o servidor está ativo e com RADIUS habilitado. |
| Autentica, mas não contabiliza | Revise o servidor de accounting e confirme a chegada de início, atualização e encerramento da sessão. |
| Gráfico de tráfego não aparece | Confira accounting, identificador da sessão, comunidade/versão SNMP e liberação de rede. |
| Desconexão não chega ao BRAS | Verifique serviço de comandos, fila pendente, SSH, privilégio do usuário e IP cadastrado. |
| PPPoE informa conflito de IP | Localize a sessão com `display access-user ip-address` e confira se um pool local do Huawei sobrepõe os prefixos do LHISP. |
| CGNAT é recusado ao salvar | Ajuste a relação entre blocos e use quantidade de portas múltipla de 256. |

## Segurança operacional

- Restrinja console, SSH, SNMP e RADIUS por rede de origem.
- Não registre credenciais reais, segredos ou comunidades nesta documentação.
- Faça backup da configuração antes de uma mudança e teste com poucos acessos.
- Não execute comandos de corte ou alteração em massa sem validar o equipamento e o domínio atuais.
- Após a implantação, confirme autenticação, accounting, gráfico, desconexão e persistência da configuração após reinício.

![BRAS Huawei](/assets/screenshots/rede-infra/bras-huawei.png)
