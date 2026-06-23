---
title: Next Billing
published: true
editor: markdown
description: ''
---

# Next Billing

## Objetivo

Configurar a integração com o NextBilling e acompanhar o histórico de eventos da API.

## Quando usar

Use esta tela quando for necessário informar os dados de acesso, habilitar a integração ou revisar os eventos registrados.

## Pré-requisitos

- Acesso ao menu **Sistema > Integrações > Next Billing**.
- Permissão para editar a integração.

## Passo a passo

1. Acesse **Sistema > Integrações > Next Billing**.
2. Informe ou revise a **Url** da API.
3. Preencha o **Usuário** de autenticação.
4. Preencha a **Senha** da integração.
5. Verifique se a integração está marcada como **Ativo**.
6. Clique em **Salvar** para persistir as alterações.
7. Consulte o **Histórico de Eventos** para acompanhar operações anteriores.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| **Url** | Endereço da API do NextBilling. |
| **Usuário** | Conta usada para autenticação na integração. |
| **Senha** | Senha associada ao usuário de integração. |
| **Ativo** | Habilita ou desabilita a integração. |
| **Salvar** | Grava a configuração atual. |
| **Histórico de Eventos** | Lista de operações registradas pela integração. |

## Resultado esperado

- A integração fica salva com as credenciais e parâmetros corretos.
- O histórico passa a refletir as operações processadas pela integração.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| URL ausente | Informar o endpoint correto da API. |
| Usuário ou senha incorretos | Revisar os dados de autenticação antes de salvar. |
| Integração desativada | Marcar a opção **Ativo**. |
| Histórico vazio | Verificar se já houve operações registradas. |

## Observações

- A tela do demo exibe a configuração da API com campos de acesso e histórico.
- O nome apresentado no menu do demo é **NextBilling**.
- A captura desta página foi feita no ambiente de demonstração.

## Dúvidas para revisão

- O nome público deve ser escrito como **Next Billing** ou **NextBilling**?
- Existe algum valor padrão para a opção **Ativo** no ambiente produtivo?

## Screenshots sugeridos

- `assets/screenshots/sistema/next-billing.png` — captura limpa da tela NextBilling no demo.

![Next Billing no demo](/assets/screenshots/sistema/next-billing.png)
