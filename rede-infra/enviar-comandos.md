---
title: Enviar Comandos
published: true
editor: markdown
description: ''
---

# Enviar Comandos

## Objetivo

Executar um comando SSH em um conjunto de servidores de rede selecionado explicitamente ou definido por filtros.

> **Atenção:** esta ação envia comandos aos equipamentos e pode interromper serviços. Use somente comandos revisados, em servidores autorizados e dentro de uma janela operacional adequada.

## Pré-requisitos

- Estar autenticado no LHISP.
- Possuir a permissão `enviar_comandos`.
- Ter servidores com acesso SSH configurado.
- Conhecer o efeito do comando no tipo de equipamento selecionado.

## Passo a passo

1. Acesse **Rede/ Infra > Ferramentas > Enviar Comandos**.
2. Em **Servidores**, mantenha **Todos** ou use **+** para escolher registros específicos. O botão de limpeza volta a seleção para **Todos**.
3. Se necessário, selecione o **Tipo** do servidor.
4. Restrinja os destinos pelas opções **Ativo**, **Transmissor Wireless**, **Servidor de Acesso/PPPoE**, **Enlace**, **OSPF**, **IP Dinâmico** e **iBGP**.
5. Informe o **Comando**.
6. Revise a seleção e clique em **Executar**.
7. Confira o comando efetivo e o retorno de cada servidor na área inferior.

## Seleção de destinos

- Sem servidores escolhidos, o backend percorre todos os servidores cadastrados e aplica os filtros marcados.
- Com uma seleção explícita, somente os IDs escolhidos são considerados, ainda sujeitos aos filtros.
- **Ativo** vem marcado inicialmente.

## Variáveis do comando

Antes da execução, o sistema substitui os seguintes marcadores para cada servidor:

| Marcador | Valor |
|---|---|
| `#ID#` | ID do servidor. |
| `#EMPRESA_ID#` | ID da empresa. |
| `#IP#` | IP configurado no servidor. |
| `#NOME#` | Nome do servidor. |

## Resultado

A área de retorno apresenta **Servidor** e **Retorno**, incluindo o comando após as substituições e a resposta da execução SSH. Falhas por servidor são exibidas sem interromper necessariamente o processamento dos demais.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| `Acesso Negado` | O usuário não possui a permissão `enviar_comandos`. |
| `Digite o comando a ser executado` | O campo **Comando** não foi enviado. |
| Nenhum servidor processado | Revise a seleção, o tipo e os filtros de função. |
| Erro de SSH | Confira IP, porta, credenciais, conectividade e compatibilidade do comando. |

## Validação

- Formulário validado no staging na rota `/lgc/redeinfra|ferramentas|enviar_comandos` sem executar comandos.
- Seleção, filtros, substituições e execução foram confirmados em `enviar_comandos.js`, `enviar_comandos.php` e `enviar_comandos_exec.php`.

## Captura de tela

![Enviar Comandos](/assets/screenshots/rede-infra/enviar-comandos.png)

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.
