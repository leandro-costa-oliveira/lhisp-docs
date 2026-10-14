---
title: 'Mikrotik: Services'
published: true
editor: markdown
description: Serviços de gerência do Mikrotik e porta SSH usada pelo LHISP.
---

# Mikrotik: Services


## Objetivo

Registrar como desativar serviços não utilizados no Mikrotik e como alterar as portas dos serviços expostos ao sistema.

## Quando usar

Use este fluxo quando for necessário:

- reduzir a superfície de exposição do Mikrotik;
- desativar serviços que não serão usados;
- trocar portas padrão de serviços;
- manter SSH e Winbox conforme a política do ambiente.

## Pré-requisitos

- Acesso ao Mikrotik pelo **Winbox**.
- Permissão administrativa para alterar serviços.
- Conhecimento das portas que serão utilizadas.
- Cuidado para não remover o acesso de administração ao equipamento.

## Passo a passo

### 1. Abrir a tela de serviços

1. Acesse o Mikrotik pelo **Winbox**.
2. Vá em **IP > Services**.
3. Revise a lista de serviços e as portas exibidas.

### 2. Desativar serviços não utilizados

1. Selecione o serviço que não será usado.
2. Clique no botão com o **X vermelho** para desativá-lo.
3. Confirme que o serviço ficou em cinza e com **X** na primeira coluna.
4. Se necessário, reative-o pelo botão com o **V azul**.

### 3. Trocar a porta de um serviço

1. Dê **duplo clique** sobre o serviço desejado.
2. No campo **Port**, informe a nova porta.
3. No caso do **SSH**, a porta configurada no Mikrotik deve ser igual à cadastrada no servidor do sistema.
4. Atualize o campo **Portas SSH** no cadastro do [servidor](/rede-infra/servidores) e confira a comunicação antes de encerrar o acesso administrativo atual.

Alterar somente a porta não restringe as origens que podem acessar o serviço. Revise também a rede de gerência e as regras de acesso do equipamento. Se o servidor usa **Conectar por**, confira o encaminhamento pelo servidor intermediário.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| **IP > Services** | Tela onde os serviços do Mikrotik são administrados. |
| **X vermelho** | Desativa o serviço selecionado. |
| **V azul** | Reativa um serviço desativado. |
| **Port** | Campo usado para trocar a porta do serviço. |
| **SSH** | Serviço necessário para a comunicação do sistema com o Mikrotik. |
| **Winbox** | Serviço que deve permanecer habilitado se o acesso administrativo depender dele. |

## Resultado esperado

- Serviços desnecessários ficam desativados.
- A porta SSH do equipamento corresponde à cadastrada no LHISP.
- SSH permanece habilitado para integração com o LHISP.
- Winbox pode permanecer habilitado para facilitar a administração.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| Perda de acesso ao equipamento | Não desative o serviço **Winbox** se ele for usado para administração. |
| Integração com o sistema falha | Verifique se o serviço **SSH** está ativo e se a porta corresponde ao cadastro do servidor. |
| Serviço continua aparecendo ativo | Confirme se a alteração foi aplicada e salva no Mikrotik. |

## Observações

- O daemon de comandos atual conecta por SSH; habilitar apenas Winbox ou API não atende esse fluxo.
- SNMP e RADIUS possuem configuração própria. Desativar um serviço de gerência não configura esses protocolos.
- Os ícones e campos do Winbox dependem da versão. Confira o estado final do serviço e preserve um caminho administrativo de retorno.

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.
