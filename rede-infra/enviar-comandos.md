---
title: Enviar Comandos
published: true
editor: markdown
description: ''
---

# Enviar Comandos


## Objetivo

Enviar comandos para equipamentos de rede a partir do módulo **Rede/Infra**, provavelmente para executar ações operacionais em lote ou diagnósticos remotos.

## Quando usar

Use este fluxo quando precisar:

- disparar comandos para um equipamento de rede;
- executar alguma ação operacional remota;
- automatizar tarefas de suporte ou manutenção;
- validar uma fila ou formulário de comandos do LHISP.

## Pré-requisitos

- Estar autenticado no LHISP.
- Ter permissão para acessar **Enviar Comandos**.
- Saber quais equipamentos ou destinos receberão os comandos.

## Passo a passo

1. Acesse **Rede/ Infra > Ferramentas > Enviar Comandos**.
2. Aguarde o carregamento da tela.
3. Se o formulário estiver disponível no ambiente real, preencha os destinos e o comando desejado.
4. Execute e confirme o retorno da operação.

## Campos importantes

> Não foi possível identificar campos, botões ou opções de execução na captura do demo. A área principal permaneceu em estado de carregamento.

## Resultado esperado

- O formulário de comandos deveria aparecer.
- O usuário deveria conseguir selecionar o destino e informar o comando.
- O sistema deveria retornar confirmação ou erro de execução.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| Tela fica apenas em carregamento | Registrar como limitação do demo ou falha real do fluxo. |
| Não há formulário visível | O backend pode não ter concluído o render. |

## Observações

- A rota observada no demo foi `/lgc/redeinfra%7Cferramentas%7Fenviar_comandos`.
- A tela é exibida no demo.
- O demo exibiu apenas a mensagem `Aguarde, carregando [redeinfra/ferramentas%7Fenviar_comandos] ...`.
- Não houve formulário operacional disponível para documentação além da mensagem de carregamento.


## Screenshots sugeridos

- Tela de carregamento do fluxo **Enviar Comandos** no demo: `assets/screenshots/rede-infra/enviar-comandos.png`

![Enviar Comandos em carregamento no demo](/assets/screenshots/rede-infra/enviar-comandos.png)

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.
