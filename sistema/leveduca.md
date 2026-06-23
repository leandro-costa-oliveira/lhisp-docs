---
title: Leveduca
published: true
editor: markdown
description: ''
---

# Leveduca

## Objetivo

Configurar a integração com a API da Leveduca.

## Quando usar

Use esta tela para revisar o token, ativar a integração e confirmar a URL associada.

## Pré-requisitos

- Acesso ao menu **Sistema > Integrações > Leveduca**.
- Permissão para editar a integração.

## Passo a passo

1. Acesse **Sistema > Integrações > Leveduca**.
2. Revise o campo **Token**.
3. Verifique se a integração está marcada como **Ativo**.
4. Clique em **Salvar**.
5. Consulte o campo de URL para confirmar o endpoint configurado.

## Campos importantes

| Elemento | Descrição |
|---|---|
| **Token** | Chave de autenticação da integração. |
| **Ativo** | Habilita ou desabilita a integração. |
| **Salvar** | Grava a configuração. |
| **Leveduca URL** | URL associada à integração. |

## Resultado esperado

- A integração fica salva com sucesso.
- O token e a URL ficam consistentes com o ambiente desejado.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| Token inválido | Revisar a chave informada. |
| Integração desativada | Marcar a opção **Ativo**. |
| URL incorreta | Confirmar o endpoint exibido. |

## Observações

- O token exibido no demo foi **redigido** na captura desta documentação por ser um dado sensível.
- A tela mostra a URL associada à integração no campo inferior.

## Dúvidas para revisão

- A URL é fixa ou pode ser personalizada?
- Há validação adicional para o token?

## Screenshots sugeridos

- `assets/screenshots/sistema/leveduca.png` — captura limpa da configuração da API Leveduca com token redigido.

![Leveduca no demo](/assets/screenshots/sistema/leveduca.png)
