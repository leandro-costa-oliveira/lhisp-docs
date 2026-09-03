---
title: Telegram
published: true
editor: markdown
description: 'Configuração das notificações do LHISP pelo Telegram'
---

# Telegram

## Objetivo

Configurar o bot e o chat usados pelo LHISP para enviar notificações ao Telegram.

## Pré-requisitos

- Permissão para editar o cadastro da empresa.
- Token válido de um bot do Telegram.
- Identificador do chat que receberá as mensagens.
- Bot adicionado e autorizado no chat de destino.

## Passo a passo

1. Acesse **Sistema > Empresa**.
2. Abra a aba **Preferências**.
3. Localize **Configurações de Notificações**.
4. Informe o **Token do Telegram**.
5. Informe o **Telegram Chat Id**.
6. Salve o cadastro da empresa.

## Campos

| Campo | Descrição |
|---|---|
| **Token do Telegram** | Token de autenticação fornecido ao criar o bot. |
| **Telegram Chat Id** | Identificador do chat, grupo ou canal que receberá a mensagem. |

## Funcionamento

O backend usa os dois campos da empresa ao executar `Empresa.NotificarTelegram`. Se token ou Chat ID não estiver configurado, a operação retorna erro. Falhas no envio ao Telegram também são reportadas pela ação.

Essa configuração não corresponde à tela **Notificações em Massa**, que possui canais e filtros próprios.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| Mensagem de token ou Chat ID não configurado | Preencha os dois campos e salve novamente a empresa. |
| Falha no envio | Valide o token, o Chat ID e a participação/permissão do bot no chat. |
| Mensagem enviada ao chat incorreto | Revise o Chat ID salvo na empresa. |

## Segurança

- Trate o token do bot como credencial secreta.
- Não publique o token em chamados, capturas de tela ou documentação.
- Revogue e gere outro token se houver exposição.

## Referências de implementação

- `lhisp-php/web/form/sistema/empresa/tab_preferencias.php`
- `lhisp-php/web/form/sistema/empresa.js`
- `lhisp-php/web/inc/actions/Empresa.php`

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.
