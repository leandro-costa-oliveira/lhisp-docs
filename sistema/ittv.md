---
title: ITTV
published: true
editor: markdown
description: ''
---

# ITTV

## Objetivo

Configurar a integração com o ITTV e acompanhar o histórico de eventos da API.

## Quando usar

Use esta tela quando for necessário habilitar a integração, revisar o token de acesso ou consultar operações registradas no histórico.

## Pré-requisitos

- Acesso ao menu **Sistema > Integrações > ITTV**.
- Permissão para editar a integração.

## Passo a passo

1. Acesse **Sistema > Integrações > ITTV**.
2. Revise o campo **Token**.
3. Verifique se a integração está marcada como **Ativo**.
4. Clique em **Salvar** para persistir as alterações.
5. Consulte o **Histórico de Eventos** para acompanhar operações anteriores.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| **Token** | Chave de autenticação da integração com a API do ITTV. |
| **Ativo** | Habilita ou desabilita a integração. |
| **Salvar** | Grava a configuração atual. |
| **Histórico de Eventos** | Lista de operações registradas pela integração. |

## Resultado esperado

- A integração fica configurada e ativa quando habilitada.
- O histórico de eventos passa a mostrar as operações registradas.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| Token não configurado | Preencha o valor correto antes de salvar. |
| Integração desativada | Marque a opção **Ativo**. |
| Histórico vazio | Verifique se já houve operações registradas na integração. |

## Observações

- O demo exibe a tela **ItTV - Configuração da API**.
- A captura desta página foi feita no ambiente de demonstração.
- O campo **Token** aparece em branco na captura de referência.

## Dúvidas para revisão

- O nome público da integração deve ser **ITTV** ou **ItTV**?
- Existe alguma validação adicional para o token além do preenchimento do campo?

## Screenshots sugeridos

- `assets/screenshots/sistema/ittv.png` — captura limpa da tela de configuração do ITTV no demo.

![ITTV no demo](/assets/screenshots/sistema/ittv.png)
