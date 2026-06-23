---
title: A2Billing
published: true
editor: markdown
description: ''
---

# A2Billing

## Objetivo

Configurar a integração com o A2Billing e acompanhar o histórico de eventos da API.

## Quando usar

Use esta tela quando for necessário informar a URL da API, revisar credenciais de acesso ou consultar operações registradas.

## Pré-requisitos

- Acesso ao menu **Sistema > Integrações > A2Billing**.
- Permissão para editar a integração.

## Passo a passo

1. Acesse **Sistema > Integrações > A2Billing**.
2. Informe ou revise a **Url** da API.
3. Confira o **Usuário** de autenticação.
4. Preencha a **Senha** quando necessário.
5. Verifique se a integração está marcada como **Ativo**.
6. Clique em **Salvar** para persistir as alterações.
7. Consulte o **Histórico de Eventos** para acompanhar as operações registradas.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| **Url** | Endereço da API do A2Billing. |
| **Usuário** | Conta usada para autenticação na integração. |
| **Senha** | Senha associada ao usuário de integração. |
| **Ativo** | Habilita ou desabilita a integração. |
| **Salvar** | Grava a configuração atual. |
| **Histórico de Eventos** | Lista de operações registradas pela integração. |

## Resultado esperado

- A integração fica salva com os parâmetros de acesso corretos.
- O histórico passa a refletir as operações processadas pela integração.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| URL ausente | Informar o endpoint correto da API. |
| Credenciais inválidas | Revisar usuário e senha antes de salvar. |
| Integração desativada | Marcar a opção **Ativo**. |
| Histórico vazio | Verificar se já houve operações registradas. |

## Observações

- A tela do demo exibe os campos **Url**, **Usuário** e **Senha**.
- O campo de **Usuário** já aparece preenchido com `admin` na captura do demo.
- A captura desta página foi feita no ambiente de demonstração.

## Dúvidas para revisão

- A URL é obrigatória mesmo quando a integração está desativada?
- Existem credenciais alternativas além de usuário e senha?

## Screenshots sugeridos

- `assets/screenshots/sistema/a2billing.png` — captura limpa da tela A2Billing no demo.

![A2Billing no demo](/assets/screenshots/sistema/a2billing.png)
