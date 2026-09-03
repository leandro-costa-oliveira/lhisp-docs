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
- URL, usuário e senha fornecidos pelo serviço A2Billing.

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

- O sistema envia `modulo: "A2Billing"`, `url`, `usuario`, `senha` e o estado de ativação para `POST /api/Integracao.salvar`.
- Após a gravação, a tela mostra **Configurações Atualizadas com Sucesso !**.
- O histórico apresenta os eventos persistidos para o módulo `A2Billing`.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| URL ausente | A tela permite salvar o campo vazio, mas a integração não terá um endereço para executar chamadas. |
| Credenciais inválidas | Revisar usuário e senha antes de salvar. |
| Integração desativada | Marcar a opção **Ativo**. |
| Histórico vazio | Verificar se já houve operações registradas. |

## Observações

- A rota da interface é `/sistema/integracoes/a2billing`.
- O formulário não marca URL, usuário ou senha como obrigatórios e não possui validação condicional ao ativar. A validade é verificada somente quando a integração tenta usar esses dados.
- A configuração implementada aceita apenas URL, usuário e senha; não há outro método de autenticação nesta tela.

## Captura de tela

![A2Billing](/assets/screenshots/sistema/a2billing.png)
