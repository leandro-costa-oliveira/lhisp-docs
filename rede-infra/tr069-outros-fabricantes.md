---
title: Compatibilidade do provisionamento TR-069
published: true
editor: markdown
description: 'Limites de compatibilidade do ACS TR-069 do LHISP'
---

# Compatibilidade do provisionamento TR-069

## Objetivo

Explicar o que o provisionamento TR-069 do LHISP implementa e quando uma CPE precisa ser homologada antes do uso em produção.

## Implementação atual

O ACS correlaciona a CPE com um acesso pelo endereço MAC e pode provisionar:

- usuário e senha PPPoE;
- ativação do Wi-Fi;
- SSID;
- senha WPA.

O provisionamento usa caminhos padrão do modelo TR-098 (`InternetGatewayDevice.*`), com instância única de WAN e WLAN. A descoberta do MAC também reconhece caminhos comuns de TR-098 e TR-181 (`Device.*`) e possui uma busca auxiliar por parâmetros terminados em `MACAddress`.

## Compatibilidade por fabricante

Não existe, no código atual, uma tabela homologada de Huawei, Juniper, Cisco ou outros fabricantes. A compatibilidade depende do modelo de dados e dos caminhos CWMP expostos por cada CPE.

CPEs que usam TR-181 para os parâmetros de PPPoE/Wi-Fi, múltiplas instâncias WAN, rádios separados ou caminhos proprietários precisam de homologação e, possivelmente, de um mapeamento específico no ACS.

## Antes de usar em produção

1. Ative o módulo TR-069 para a empresa.
2. Configure o TR-069 no cadastro da rede. O gateway/ACS é derivado do servidor LHISP associado à rede.
3. Valide a CPE em laboratório com o mesmo fabricante, modelo e firmware usados em campo.
4. Confirme que o `Inform` ou a resposta de consulta entrega um MAC correspondente ao acesso no LHISP.
5. Confira o resultado do provisionamento e os estados retornados pelo ACS.

## Estados do provisionamento

| Estado | Significado |
|---|---|
| **PROVISIONADO** | A CPE aceitou os parâmetros enviados, ou o acesso não tinha parâmetros e foi registrado somente como inventário. Confira a mensagem retornada. |
| **DESCONHECIDA** | O MAC informado não corresponde a um acesso válido. |
| **ERRO_PROV** | A CPE retornou `Fault` durante o provisionamento. |
| **SEM_MODULO** | Valor previsto no contrato de estados. No fluxo atual, o ACS responde ao `Inform` sem inventariar nem provisionar a CPE, e não publica esse callback. |

## Limitações

- A tela **Rede e Infra > TR-069** é somente para consulta das redes ativas e do status do setup.
- A ativação, desativação e reaplicação são feitas no cadastro de cada rede.
- Não use comandos de configuração sugeridos genericamente para um fabricante. Esses comandos não fazem parte da implementação do LHISP e variam por equipamento e firmware.
- Quando houve envio de parâmetros, **PROVISIONADO** confirma a resposta ao `SetParameterValues`; a mensagem pode indicar que é necessário reiniciar a CPE. Em casos de somente inventário, esse status não comprova alteração de configuração. Valide PPPoE e Wi-Fi no equipamento homologado.
- As sessões CWMP ficam em memória e expiram após 60 segundos de inatividade. Reinício do daemon ou diálogo interrompido não garante callback **ERRO_PROV**; investigue os logs e o próximo `Inform` se a tela permanecer com estado antigo.

## Problemas comuns

| Problema | Verificação |
|---|---|
| CPE aparece como desconhecida | Compare o MAC reportado pela CPE com o MAC cadastrado no acesso. |
| CPE responde com falha | Confira o modelo de dados e os caminhos CWMP aceitos pelo firmware. |
| PPPoE funciona, mas Wi-Fi não é alterado | Verifique se o acesso possui Wi-Fi habilitado, SSID e senha, e se a CPE aceita os caminhos TR-098 usados pelo ACS. |
| Rede não aparece na consulta | Confirme que o TR-069 está ativo no cadastro da rede. |

## Referências de implementação

- `lhisp-daemon-tr069/src/services/Provisionamento.ts`
- `lhisp-daemon-tr069/src/services/MacDiscovery.ts`
- `lhisp-frontend/src/paginas/redeinfra/tr069/Tr069.tsx`

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.
