---
title: Telegram
published: true
editor: markdown
description: ''
---

# Telegram

> **⚠️ Rascunho gerado por agente**
>
> Este documento foi produzido a partir da exploração da wiki do LHISP e da tela equivalente no ambiente de demonstração. Mensagens e dados exibidos são apenas do ambiente de teste.

## Objetivo

Configurar o envio de notificações para o Telegram por meio do fluxo de envio em massa, permitindo disparos por SMS, App, WhatsApp e e-mail conforme as opções disponíveis no sistema.

## Quando usar

Use este fluxo quando for necessário:

- preparar um bot do Telegram para notificações;
- organizar um grupo para receber mensagens;
- configurar o LHISP para envio em massa de notificações;
- revisar os filtros e os canais de envio disponíveis.

## Pré-requisitos

- Acesso ao menu relacionado a **Notificações em Massa** no demo.
- Bot do Telegram criado no **@BotFather**.
- Grupo do Telegram preparado para receber as mensagens.
- Permissão para revisar filtros e canais de envio.

## Passo a passo

1. Crie o bot no Telegram usando o **@BotFather**.
2. Defina um *username* para o bot terminando com `bot`.
3. Crie um grupo para as notificações.
4. Adicione o bot ao grupo criado.
5. No LHISP, acesse a tela de **Envio em Massa de Notificações**.
6. Escreva o texto da mensagem no campo de envio.
7. Escolha os canais desejados entre **SMS**, **App**, **Whatsapp** e **E-mail**.
8. Use **Exibir** para revisar e **Enviar** para disparar a notificação.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| **Texto para Envio via** | Mensagem que será disparada aos destinatários. |
| **SMS / App / Whatsapp / E-mail** | Canais de envio disponíveis na tela. |
| **Exibir** | Permite visualizar o conteúdo antes do disparo. |
| **Enviar** | Executa o envio da notificação. |
| **Filtros Gerais** | Área de filtros adicionais para o disparo. |
| **Filtros de Endereço** | Área de filtros por rede e endereço. |

## Resultado esperado

- O bot do Telegram fica preparado para receber notificações.
- O grupo do Telegram recebe os alertas enviados pelo LHISP.
- A tela de envio em massa mostra os filtros e os canais corretos para a operação.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| O bot não recebe mensagens | Confirme se ele foi adicionado ao grupo e se o username termina com `bot`. |
| O envio não dispara | Verifique se o texto foi preenchido e se o canal correto foi selecionado. |
| O grupo não aparece para notificação | Confirme se o bot foi incluído no grupo antes do envio. |
| Os filtros não exibem dados | Verifique se a seleção de rede/setor está preenchida. |

## Observações

- A wiki orienta criar um bot com o **@BotFather**.
- A wiki orienta criar um grupo e adicionar o bot antes da configuração no LHISP.
- No demo, a tela equivalente aparece como **Envio em Massa de Notificações (Sms / Push / Email)** dentro do sistema legado.
- A captura usada nesta página veio do ambiente de demonstração, não da wiki.

## Dúvidas para revisão

- A documentação deve chamar essa integração de **Telegram** ou de **Notificações em Massa**?
- O fluxo de WhatsApp/App/E-mail deve virar uma página separada?
- Há algum campo obrigatório adicional no fluxo legado que não aparece na tela atual?

## Screenshots sugeridos

- Tela de **Envio em Massa de Notificações** no demo: `assets/screenshots/sistema/telegram.png`

![Telegram / Envio em Massa de Notificações no demo](/assets/screenshots/sistema/telegram.png)
